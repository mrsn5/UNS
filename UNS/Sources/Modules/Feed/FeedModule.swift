//
//  FeedModule.swift
//  UNS
//
//  Created by San Byn Nguyen on 28.12.2019.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit
import os.log

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

    func build(_ view: FeedView) {
        let interactor = FeedInteractor()
        let presenter = FeedPresenter()
        let router = FeedRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.presenter = presenter
        os_log("FeedModule is configured.", log: .viper, type: .info)
    }
}
