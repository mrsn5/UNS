//
//  ArticleModule.swift
//  UNS
//
//  Created by San Byn Nguyen on 12.02.2020.
//  Copyright © 2020 San Byn Nguyen. All rights reserved.
//
import UIKit
import os.log

// MARK: - router
protocol ArticleRouterPresenterProtocol: RouterPresenterProtocol {

}

// MARK: - presenter
protocol ArticlePresenterRouterProtocol: PresenterRouterProtocol {

}

protocol ArticlePresenterInteractorProtocol: PresenterInteractorProtocol {

}

protocol ArticlePresenterViewProtocol: PresenterViewProtocol {
    func start()
}

// MARK: - interactor
protocol ArticleInteractorPresenterProtocol: InteractorPresenterProtocol {

}

// MARK: - view
protocol ArticleViewPresenterProtocol: ViewPresenterProtocol {
    func setup(_ news: News)
}

class ArticleModule: Module {
    typealias View = ArticleView
    typealias Router = ArticleRouter
    typealias Interactor = ArticleInteractor
    typealias Presenter = ArticlePresenter


    func build(_ news: News) -> ArticleView {
        var view = ArticleView.instantiate()
        var interactor = ArticleInteractor()
        var presenter = ArticlePresenter(news)
        var router = ArticleRouter()
        assemble(view: &view, presenter: &presenter, router: &router, interactor: &interactor)
        router.viewController = view

        os_log("ArticleModule is configured.", log: .viper, type: .info)
        return view
    }
}
