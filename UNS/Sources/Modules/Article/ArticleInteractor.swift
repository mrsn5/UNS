//
// Created by San Byn Nguyen on 12.02.2020.
// Copyright (c) 2020 San Byn Nguyen. All rights reserved.
//

import Foundation

class ArticleInteractor: InteractorProtocol {
    var presenter: ArticlePresenterInteractorProtocol!
    var newsService: NewsService = NewsAPIService()
}

extension ArticleInteractor: ArticleInteractorPresenterProtocol {

}