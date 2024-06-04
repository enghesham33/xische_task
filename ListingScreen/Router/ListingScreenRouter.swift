//
//  ListingScreenRouter.swift
//  ListingScreen
//
//  Created by Hesham Khaled on 03/06/2024.
//

import UIKit

public class ListingScreenRouter: ListingScreenRouterProtocol {
    public static func createListingScreenView() -> ListingScreenViewController {
        let view = ListingScreenViewController(nibName: "ListingScreenViewController", bundle: Bundle(for: ListingScreenViewController.self))
        
        let presenter: ListingScreenPresenterProtocol & ListingScreenInteractorOutputProtocol = ListingScreenPresenter()
        
        let interactor: ListingScreenInteractorInputProtocol = ListingScreenInteractor()
        
        let apiDataManager: ListingScreenAPIDataManagerInputProtocol = ListingScreenAPIDataManager()
        
        let localDataManager: ListingScreenLocalDataManagerInputProtocol = ListingScreenLocalDataManager()
        
        let router: ListingScreenRouterProtocol = ListingScreenRouter()
        
        router.view = view
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.apiDataManager = apiDataManager
        interactor.localDataManager = localDataManager
        
        return view
    }
    
    weak var view: UIViewController?
    
    func openDetailsScreen(university: University?) {
        
    }
}
