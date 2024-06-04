//
//  UniversitiesResponse.swift
//  ListingScreen
//
//  Created by Hesham Khaled on 03/06/2024.
//

import Foundation

public struct University: Codable {
    public let alphaTwoCode: String?
    public let domains: [String]?
    public let name: String?
    public let webPages: [String]?
    public let country, stateProvince: String?
    
    public init(alphaTwoCode: String?, domains: [String]?, name: String?, webPages: [String]?, country: String?, stateProvince: String?) {
        self.alphaTwoCode = alphaTwoCode
        self.domains = domains
        self.name = name
        self.webPages = webPages
        self.country = country
        self.stateProvince = stateProvince
    }

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
