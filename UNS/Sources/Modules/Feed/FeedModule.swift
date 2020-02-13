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
protocol FeedRouterPresenterProtocol: RouterPresenterProtocol {
    func routeArticle(_ news: News)
}

// MARK: - presenter
protocol FeedPresenterRouterProtocol: PresenterRouterProtocol {
    
}

protocol FeedPresenterInteractorProtocol: PresenterInteractorProtocol {
    func presentNews(_ news: [News])
}

protocol FeedPresenterViewProtocol: PresenterViewProtocol {
    func start()
    func showArticle(_ news: News)
}

// MARK: - interactor
protocol FeedInteractorPresenterProtocol: InteractorPresenterProtocol {
    func loadNews()
}

// MARK: - view
protocol FeedViewPresenterProtocol: ViewPresenterProtocol {
    func setup()
    func showNews(_ news: [News])
}

// MARK: - module builder
final class FeedModule: Module {
    typealias View = FeedView
    typealias Router = FeedRouter
    typealias Interactor = FeedInteractor
    typealias Presenter = FeedPresenter
    

    func build() -> FeedView {
        var view = FeedView.instantiate()
        var interactor = FeedInteractor()
        var presenter = FeedPresenter()
        var router = FeedRouter()
        assemble(view: &view, presenter: &presenter, router: &router, interactor: &interactor)
        router.viewController = view
        
        os_log("FeedModule is configured.", log: .viper, type: .info)
        return view
    }
}
