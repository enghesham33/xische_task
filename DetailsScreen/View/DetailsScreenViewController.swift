//
//  DetailsScreenViewController.swift
//  DetailsScreen
//
//  Created by Hesham Khaled on 04/06/2024.
//

import UIKit
import ListingScreen

public class DetailsScreenViewController: UIViewController {
    
    var presenter: DetailsScreenPresenterProtocol?

    @IBOutlet weak var universityNameLabel: UILabel!
    @IBOutlet weak var universityStateLabel: UILabel!
    @IBOutlet weak var universityCountryLabel: UILabel!
    @IBOutlet weak var universityCountryCodeLabel: UILabel!
    @IBOutlet weak var webPagesLabel: UILabel!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewLoaded()
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension DetailsScreenViewController: DetailsScreenViewProtocol {
    
    func showData(university: University?) {
        universityNameLabel.text = university?.name
        universityStateLabel.text = university?.stateProvince
        universityCountryLabel.text = university?.country
        universityCountryCodeLabel.text = university?.alphaTwoCode
        webPagesLabel.text = university?.webPages?.joined(separator: "\n\n")
    }
}
