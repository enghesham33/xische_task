//
//  ListingScreenInteractor.swift
//  ListingScreen
//
//  Created by Hesham Khaled on 03/06/2024.
//

import Foundation

public class ListingScreenInteractor: ListingScreenInteractorInputProtocol {
    
    
    weak var presenter: ListingScreenInteractorOutputProtocol?
    
    var apiDataManager: ListingScreenAPIDataManagerInputProtocol?
    
    var localDataManager: ListingScreenLocalDataManagerInputProtocol?
    
    func getUniversities() {
        presenter?.showLoader()
        apiDataManager?.getUniversities(completionHandler: {[weak self] universities in
            
            self?.presenter?.hideLoader()
            self?.presenter?.universitiesLoaded(universities: universities)
            self?.localDataManager?.saveUniversities(universities: self?.convertUniversitiesToUniversitiesRealm(universities: universities) ?? [])
            
        }, failedHandler: {[weak self] error in
            
            self?.presenter?.hideLoader()
            if let localUniversities = self?.localDataManager?.fetchAllUniversities(), !localUniversities.isEmpty {
                self?.presenter?.universitiesLoaded(universities: self?.convertUniversitiesRealmToUniversities(universitiesRealm: localUniversities) ?? [])
            } else {
                self?.presenter?.showErrorMessage(message: error ?? "")
            }

        })
    }
    
    private func convertUniversitiesToUniversitiesRealm(universities: [University]) -> [UniversityRealm] {
        var universitiesRealm = [UniversityRealm]()
        for university in universities {
            universitiesRealm.append(university.convertToUniversityRealm())
        }
        return universitiesRealm
    }
    
    private func convertUniversitiesRealmToUniversities(universitiesRealm: [UniversityRealm]) -> [University] {
        var universities = [University]()
        for university in universitiesRealm {
            universities.append(university.convertToUniversity())
        }
        return universities
    }
}
