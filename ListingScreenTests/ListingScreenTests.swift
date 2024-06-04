//
//  ListingScreenTests.swift
//  ListingScreenTests
//
//  Created by Hesham Khaled on 04/06/2024.
//

import XCTest
@testable import ListingScreen

final class ListingScreenTests: XCTestCase {
    
    var view: ListingScreenViewProtocol?
    
    var emptyRepository: ListScreenFakeEmptyAPIDataManager?
    var listRepository: ListScreenFakeListAPIDataManager?
    var errorRepository: ListScreenFakeErrorAPIDataManager?
    
    override func setUpWithError() throws {
        
        view = ListingScreenRouter.createListingScreenView()
        emptyRepository = ListScreenFakeEmptyAPIDataManager()
        listRepository = ListScreenFakeListAPIDataManager()
        errorRepository = ListScreenFakeErrorAPIDataManager()
    }

    override func tearDownWithError() throws {
        view = nil
        emptyRepository = nil
        listRepository = nil
        errorRepository = nil
    }

    func testEmpty() throws {
        if let presenter = view?.presenter {
            presenter.interactor?.apiDataManager = emptyRepository
            presenter.viewWillAppear()
            assert(presenter.numberOfItems() == 0)
        }
    }
    
    func testList() throws {
        if let presenter = view?.presenter {
            presenter.interactor?.apiDataManager = listRepository
            presenter.viewWillAppear()
            assert(presenter.numberOfItems() == 2)
        }
    }
    
    func testError() throws {
        if let presenter = view?.presenter {
            presenter.interactor?.apiDataManager = errorRepository
            presenter.viewWillAppear()
            assert(presenter.universities == nil)
        }
    }

}
