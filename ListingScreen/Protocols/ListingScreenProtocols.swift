//
//  ListingScreenProtocols.swift
//  ListingScreen
//
//  Created by Hesham Khaled on 03/06/2024.
//

import UIKit

// MARK:- View protocols
// MARK: Presenter -> View
protocol ListingScreenViewProtocol: AnyObject {
    var presenter: ListingScreenPresenterProtocol? { get set }
    func showLoader()
    func hideLoader()
    func showMessage(message: String?)
    func reloadData()
}

// MARK:- Presenter protocols
// MARK: View -> Presenter
protocol ListingScreenPresenterProtocol: AnyObject {
    var view: ListingScreenViewProtocol? { get set }
    var interactor: ListingScreenInteractorInputProtocol? { get set }
    var router: ListingScreenRouterProtocol? { get set }
    
    var universities: [University]? { get set }
    func viewWillAppear()
    func swipeToRefresh()
    
    func numberOfItems() -> Int
    func item(at index: Int) -> University?
    func userDidSelectItem(at index: Int)
}

// MARK: Interactor -> Presenter
protocol ListingScreenInteractorOutputProtocol: AnyObject {
    func showLoader()
    func hideLoader()
    func universitiesLoaded(universities: [University])
    func showErrorMessage(message: String)
}

// MARK:- Interactor Protocols
// MARK: Presenter -> Interactor
protocol ListingScreenInteractorInputProtocol: AnyObject {
    var presenter: ListingScreenInteractorOutputProtocol? { get set }
    var apiDataManager: ListingScreenAPIDataManagerInputProtocol? { get set }
    var localDataManager: ListingScreenLocalDataManagerInputProtocol? { get set }
    
    func getUniversities()
}

// MARK:- Wireframe Protocols
protocol ListingScreenRouterProtocol: AnyObject {
    static func createListingScreenView() -> ListingScreenViewController
    
    var view: UIViewController? { get set }
    static var navigationHandler: ((University?, UINavigationController?) -> ())? {get set}
    func openDetailsScreen(university: University?)
}

// MARK:- APIDATAMANAGER Protocols
protocol ListingScreenAPIDataManagerInputProtocol: AnyObject {
    func getUniversities(completionHandler: @escaping ([University]) -> (), failedHandler: @escaping (String?) -> Void)
}

// MARK:- LocalDataManager Protocols
protocol ListingScreenLocalDataManagerInputProtocol: AnyObject {
    
    func saveUniversities(universities: [UniversityRealm])
    
    func fetchAllUniversities() -> [UniversityRealm]
    
}
