//
//  DetailsScreenProtocol.swift
//  DetailsScreen
//
//  Created by Hesham Khaled on 04/06/2024.
//

import Foundation
import ListingScreen
import UIKit

// MARK:- View protocols
// MARK: Presenter -> View
protocol DetailsScreenViewProtocol: AnyObject {
    var presenter: DetailsScreenPresenterProtocol? { get set }
    func showData(university: University?)
}

// MARK:- Presenter protocols
// MARK: View -> Presenter
protocol DetailsScreenPresenterProtocol: AnyObject {
    var view: DetailsScreenViewProtocol? { get set }
    var interactor: DetailsScreenInteractorInputProtocol? { get set }
    var router: DetailsScreenRouterProtocol? { get set }
    
    func viewLoaded()
}

// MARK: Interactor -> Presenter
protocol DetailsScreenInteractorOutputProtocol: AnyObject {
    func showData(university: University?)
}

// MARK:- Interactor Protocols
// MARK: Presenter -> Interactor
protocol DetailsScreenInteractorInputProtocol: AnyObject {
    var presenter: DetailsScreenInteractorOutputProtocol? { get set }
    var apiDataManager: DetailsScreenAPIDataManagerInputProtocol? { get set }
    var localDataManager: DetailsScreenLocalDataManagerInputProtocol? { get set }
    var university: University? { get set }
    
    func getUniversity()
}

// MARK:- Wireframe Protocols
protocol DetailsScreenRouterProtocol: AnyObject {
    static func createDetailsScreenView(university: University?) -> DetailsScreenViewController
}

// MARK:- APIDATAMANAGER Protocols
protocol DetailsScreenAPIDataManagerInputProtocol: AnyObject {
    
}

// MARK:- LocalDataManager Protocols
protocol DetailsScreenLocalDataManagerInputProtocol: AnyObject {
    
}
