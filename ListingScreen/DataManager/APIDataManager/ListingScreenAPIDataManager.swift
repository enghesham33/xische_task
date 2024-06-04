//
//  ListingScreenAPIDataManager.swift
//  ListingScreen
//
//  Created by Hesham Khaled on 03/06/2024.
//

import Alamofire

public class ListingScreenAPIDataManager: ListingScreenAPIDataManagerInputProtocol {
    func getUniversities(completionHandler: @escaping ([University]) -> (), failedHandler: @escaping (String?) -> Void) {
        AF.request(MAIN_URL + SEARCH_API).response { response in
            switch response.result {
            case .success(let data):
                do {
                    if let data = data {
                        let decodedData = try JSONDecoder().decode([University].self, from: data)
                        completionHandler(decodedData)
                    } else {
                        failedHandler("Error decoding data: No json")
                    }
                } catch {
                    failedHandler("Error decoding data: \(error)")
                }
                break
                
            case .failure(let error):
                failedHandler(error.localizedDescription)
                break
            }
        }
    }
}
