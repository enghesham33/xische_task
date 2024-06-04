//
//  ListingScreenViewController.swift
//  ListingScreen
//
//  Created by Hesham Khaled on 03/06/2024.
//

import UIKit
import Toast_Swift

public class ListingScreenViewController: UIViewController {

    var presenter: ListingScreenPresenterProtocol?
    
    let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet {
            activityIndicator.hidesWhenStopped = true
        }
    }
    @IBOutlet weak var universitiesTableView: UITableView! {
        didSet {
            let nib = UINib(nibName: "UniversityCell", bundle: Bundle(for: UniversityCell.self))
            universitiesTableView.register(nib, forCellReuseIdentifier: "UniversityCell")
            
            universitiesTableView.dataSource = self
            universitiesTableView.delegate = self
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControl()
        presenter?.viewLoaded()
    }
    
    private func setupRefreshControl() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        universitiesTableView.addSubview(refreshControl)
    }

    @objc func refresh(_ sender: AnyObject) {
        presenter?.swipeToRefresh()
    }
}

extension ListingScreenViewController: ListingScreenViewProtocol {
    
    func showLoader() {
        activityIndicator.startAnimating()
    }
    
    func hideLoader() {
        activityIndicator.stopAnimating()
    }
    
    func showMessage(message: String?) {
        self.view.makeToast(message)
    }
    
    func reloadData() {
        universitiesTableView.reloadData()
        refreshControl.endRefreshing()
    }
}

extension ListingScreenViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfItems() ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UniversityCell", for: indexPath) as? UniversityCell else {return UITableViewCell()}
        cell.university = presenter?.item(at: indexPath.row)
        return cell
    }
}
