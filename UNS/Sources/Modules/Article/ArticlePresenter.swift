//
// Created by San Byn Nguyen on 12.02.2020.
// Copyright (c) 2020 San Byn Nguyen. All rights reserved.
//

import Foundation
import os.log

class ArticlePresenter: PresenterProtocol {
    weak var view: ArticleViewPresenterProtocol!
    var interactor: ArticleInteractorPresenterProtocol!
    var router: ArticleRouterPresenterProtocol!
    
    let news: News
    
    init(_ news: News) {
        self.news = news
    }
}

extension ArticlePresenter: ArticlePresenterViewProtocol {
    func start() {
        os_log("ArticlePresenter started", log: .viper, type: .info)
        view.setup(news)
    }
}

extension ArticlePresenter: ArticlePresenterRouterProtocol {

}

extension ArticlePresenter: ArticlePresenterInteractorProtocol {
}
