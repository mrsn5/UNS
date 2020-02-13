//
//  FeedPresenter.swift
//  UNS
//
//  Created by San Byn Nguyen on 28.12.2019.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import Foundation
import os.log

class FeedPresenter: PresenterProtocol {
    weak var view: FeedViewPresenterProtocol!
    var interactor: FeedInteractorPresenterProtocol!
    var router: FeedRouterPresenterProtocol!
}

extension FeedPresenter: FeedPresenterViewProtocol {
    func showArticle(_ news: News) {
        router.routeArticle(news)
    }
    
    func start() {
        os_log("FeedPresenter started", log: .viper, type: .info)
        view.setup()
        interactor.loadNews()
    }
}

extension FeedPresenter: FeedPresenterRouterProtocol {
    
}

extension FeedPresenter: FeedPresenterInteractorProtocol {
    func presentNews(_ news: [News]) {
        view.showNews(news)
    }
}
