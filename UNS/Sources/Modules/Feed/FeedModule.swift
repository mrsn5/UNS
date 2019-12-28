//
//  FeedModule.swift
//  UNS
//
//  Created by San Byn Nguyen on 28.12.2019.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit

// MARK: - router
protocol FeedRouterPresenterProtocol: class {
   
}

// MARK: - presenter
protocol FeedPresenterRouterProtocol: class {
    
}

protocol FeedPresenterInteractorProtocol: class {
   
}

protocol FeedPresenterViewProtocol: class {
    
    func start()
}

// MARK: - interactor
protocol FeedInteractorPresenterProtocol: class {
    
}

// MARK: - view
protocol FeedViewPresenterProtocol: class {
    
}

// MARK: - module builder

final class FeedModule {

    func build() -> UIViewController {
        let view = FeedView()
        let interactor = FeedInteractor()
        let presenter = FeedPresenter()
        let router = FeedRouter()

        view.presenter = presenter as? FeedPresenterViewProtocol
        presenter.view = view as? FeedViewPresenterProtocol
        presenter.interactor = interactor as? FeedInteractorPresenterProtocol
        presenter.router = router as? FeedRouterPresenterProtocol
        interactor.presenter = presenter as? FeedPresenterInteractorProtocol
        router.presenter = presenter as? FeedPresenterRouterProtocol
        
        return view
    }
}
