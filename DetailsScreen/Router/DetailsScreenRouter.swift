//
//  DetailsScreenRouter.swift
//  DetailsScreen
//
//  Created by Hesham Khaled on 04/06/2024.
//

import ListingScreen

public class DetailsScreenRouter: DetailsScreenRouterProtocol {
    public static func createDetailsScreenView(university: University?) -> DetailsScreenViewController {
        let view = DetailsScreenViewController(nibName: "DetailsScreenViewController", bundle: Bundle(for: DetailsScreenViewController.self))
        
        let presenter: DetailsScreenPresenterProtocol & DetailsScreenInteractorOutputProtocol = DetailsScreenPresenter()
        
        let interactor: DetailsScreenInteractorInputProtocol = DetailsScreenInteractor(university: university)
        
        let apiDataManager: DetailsScreenAPIDataManagerInputProtocol = DetailsScreenAPIDataManager()
        
        let localDataManager: DetailsScreenLocalDataManagerInputProtocol = DetailsScreenLocalDataManager()
        
        let router: DetailsScreenRouterProtocol = DetailsScreenRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.apiDataManager = apiDataManager
        interactor.localDataManager = localDataManager
        
        return view
    }
}
