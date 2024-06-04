//
//  UniversityRealm.swift
//  ListingScreen
//
//  Created by Hesham Khaled on 04/06/2024.
//

import RealmSwift

public class UniversityRealm: Object {
    @Persisted(primaryKey: true) var id: ObjectId = ObjectId.generate()
    @Persisted var alphaTwoCode: String = ""
    @Persisted var domains: String = "" // separated by commas
    @Persisted var name: String = ""
    @Persisted var webPages: String = "" // separated by commas
    @Persisted var country: String = ""
    @Persisted var stateProvince: String = ""
    
    func convertToUniversity() -> University {
        let domainsArray = domains.split(separator: ",").map { subString in
            String(subString)
        }
        
        let webPagesArray = webPages.split(separator: ",").map { subString in
            String(subString)
        }
        
        return University(alphaTwoCode: alphaTwoCode, domains: domainsArray, name: name, webPages: webPagesArray, country: country, stateProvince: stateProvince)
    }
}
