//
//  ListingScreenLocalDataManager.swift
//  ListingScreen
//
//  Created by Hesham Khaled on 03/06/2024.
//

import RealmSwift

public class ListingScreenLocalDataManager: ListingScreenLocalDataManagerInputProtocol {
    
    func fetchAllUniversities() -> [UniversityRealm] {
        return RealmManager.shared.fetchAllUniversities() ?? []
    }
    
    func saveUniversities(universities: [UniversityRealm]) {
        RealmManager.shared.addUniversities(universities: universities)
    }
}
