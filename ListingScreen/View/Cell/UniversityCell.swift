//
//  UniversityCell.swift
//  ListingScreen
//
//  Created by Hesham Khaled on 03/06/2024.
//

import UIKit

class UniversityCell: UITableViewCell {
    
    @IBOutlet weak var universityNameLabel: UILabel!
    @IBOutlet weak var universityStateLabel: UILabel!
    
    var university: University? {
        didSet {
            if let university = university {
                universityNameLabel.text = university.name
                if let stateProvince = university.stateProvince, !stateProvince.isEmpty {
                    universityStateLabel.text = stateProvince
                } else {
                    universityStateLabel.text = university.country
                }
            }
        }
    }
    
}
