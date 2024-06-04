//
//  UniversitiesResponse.swift
//  ListingScreen
//
//  Created by Hesham Khaled on 03/06/2024.
//

import Foundation

struct University: Codable {
    let alphaTwoCode: String?
    let domains: [String]?
    let name: String?
    let webPages: [String]?
    let country, stateProvince: String?

    enum CodingKeys: String, CodingKey {
        case alphaTwoCode = "alpha_two_code"
        case domains, name
        case webPages = "web_pages"
        case country
        case stateProvince = "state-province"
    }
    
    func convertToUniversityRealm() -> UniversityRealm {
        let universityRealm = UniversityRealm()
        universityRealm.alphaTwoCode = alphaTwoCode ?? ""
        universityRealm.name = name ?? ""
        universityRealm.country = country ?? ""
        universityRealm.stateProvince = stateProvince ?? ""
        universityRealm.webPages = webPages?.joined(separator: ",") ?? ""
        universityRealm.domains = domains?.joined(separator: ",") ?? ""
        return universityRealm
    }
}
