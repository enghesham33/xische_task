//
//  ListScreenFakeAPIDataManager.swift
//  ListingScreen
//
//  Created by Hesham Khaled on 04/06/2024.
//

import Foundation

public class ListScreenFakeEmptyAPIDataManager: ListingScreenAPIDataManagerInputProtocol {
    func getUniversities(completionHandler: @escaping ([University]) -> (), failedHandler: @escaping (String?) -> Void) {
        completionHandler([])
    }
}

public class ListScreenFakeListAPIDataManager: ListingScreenAPIDataManagerInputProtocol {
    func getUniversities(completionHandler: @escaping ([University]) -> (), failedHandler: @escaping (String?) -> Void) {
        let fakeUniversities = [
            University(alphaTwoCode: "FC1", domains: ["http://www.domain1.com", "http://www.domain2.com"], name: "Fake university 1", webPages: ["http://www.webPage1.com", "http://www.webPage2.com"], country: "Fake Country 1", stateProvince: "Fake State 1"),
                                
            University(alphaTwoCode: "FC2", domains: ["http://www.domain3.com", "http://www.domain4.com"], name: "Fake university 2", webPages: ["http://www.webPage3.com", "http://www.webPage4.com"], country: "Fake Country 2", stateProvince: "Fake State 2")
        ]
        
        completionHandler(fakeUniversities)
    }
}

public class ListScreenFakeErrorAPIDataManager: ListingScreenAPIDataManagerInputProtocol {
    func getUniversities(completionHandler: @escaping ([University]) -> (), failedHandler: @escaping (String?) -> Void) {
        failedHandler("Some error happened")
    }
}
