//
//  ListingScreenPresenter.swift
//  ListingScreen
//
//  Created by Hesham Khaled on 03/06/2024.
//

import Foundation

public class ListingScreenPresenter: ListingScreenPresenterProtocol {
        
    weak var view: ListingScreenViewProtocol?
    var interactor: ListingScreenInteractorInputProtocol?
    var router: ListingScreenRouterProtocol?
    var universities: [University]?
    
    func viewWillAppear() {
        if (universities?.count ?? 0) > 0 {
            universities?.removeAll()
            view?.reloadData()
        }
        interactor?.getUniversities()
    }
    
    func swipeToRefresh() {
        universities?.removeAll()
        view?.reloadData()
        interactor?.getUniversities()
    }
    
    func numberOfItems() -> Int {
        return universities?.count ?? 0
    }
    
    func userDidSelectItem(at index: Int) {
        router?.openDetailsScreen(university: item(at: index))
    }
    
    func item(at index: Int) -> University? {
        return universities?[index]
    }
}

extension ListingScreenPresenter: ListingScreenInteractorOutputProtocol {
    func universitiesLoaded(universities: [University]) {
        self.universities = universities
        view?.reloadData()
    }
    
    func showLoader() {
        view?.showLoader()
    }
    
    func hideLoader() {
        view?.hideLoader()
    }
    
    func showErrorMessage(message: String) {
        view?.showMessage(message: message)
    }
}
