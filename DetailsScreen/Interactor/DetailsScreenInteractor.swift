//
//  DetailsScreenInteractor.swift
//  DetailsScreen
//
//  Created by Hesham Khaled on 04/06/2024.
//

import ListingScreen

class DetailsScreenInteractor: DetailsScreenInteractorInputProtocol {
    var presenter: (any DetailsScreenInteractorOutputProtocol)?
    
    var apiDataManager: (any DetailsScreenAPIDataManagerInputProtocol)?
    
    var localDataManager: (any DetailsScreenLocalDataManagerInputProtocol)?
    
    var university: University?
    
    init(university: University?) {
        self.university = university
    }
    
    func getUniversity() {
        presenter?.showData(university: university)
    }
}
