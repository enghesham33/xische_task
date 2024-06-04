//
//  RealmManager.swift
//  ListingScreen
//
//  Created by Mayar Khaled on 03/06/2024.
//

import Foundation
import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    
    private var realm: Realm
    
    private init() {
        do {
            let config = Realm.Configuration(
                // Set the new schema version. This must be greater than the previously used
                // version (if you've never set a schema version before, the version is 0).
                schemaVersion: 0,
                
                // Set the block which will be called automatically when opening a Realm with
                // a schema version lower than the one set above
                migrationBlock: { migration, oldSchemaVersion in
                    // We haven’t migrated anything yet, so oldSchemaVersion == 0
                    if (oldSchemaVersion < 0) {
                        // Nothing to do!
                        // Realm will automatically detect new properties and removed properties
                        // And will update the schema on disk automatically
                    }
                })
            
            // Tell Realm to use this new configuration object for the default Realm
            Realm.Configuration.defaultConfiguration = config
            realm = try Realm()
        } catch {
            fatalError("Realm initialization error: \(error.localizedDescription)")
        }
    }
    
    // Fetch Universitues
    func fetchAllUniversities() -> [UniversityRealm]? {
        return Array(realm.objects(UniversityRealm.self))
    }
    
    func addUniversities(universities: [UniversityRealm]) {
        do {
            try realm.write {
                realm.deleteAll()
                realm.add(universities)
            }
        } catch {
            print("Failed to save data: \(error.localizedDescription)")
        }
    }
}
