//
//  DetailsScreenPresenter.swift
//  DetailsScreen
//
//  Created by Hesham Khaled on 04/06/2024.
//

import ListingScreen

class DetailsScreenPresenter: DetailsScreenPresenterProtocol {
    var view: DetailsScreenViewProtocol?
    
    var interactor: DetailsScreenInteractorInputProtocol?
    
    var router: DetailsScreenRouterProtocol?
    
    func viewLoaded() {
        interactor?.getUniversity()
    }
    
    
}

extension DetailsScreenPresenter: DetailsScreenInteractorOutputProtocol {
    func showData(university: University?) {
        view?.showData(university: university)
    }
    
    
}
