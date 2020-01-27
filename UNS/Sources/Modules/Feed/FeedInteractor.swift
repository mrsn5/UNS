//
//  FeedInteractor.swift
//  UNS
//
//  Created by San Byn Nguyen on 28.12.2019.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import Foundation

class FeedInteractor: InteractorProtocol {
    var presenter: FeedPresenterInteractorProtocol!
    var newsService: NewsService = NewsAPIService()
}

extension FeedInteractor: FeedInteractorPresenterProtocol {
    func loadNews() {
        newsService.loadTopHeadlines { (news) in
            guard let news = news else {return}
            self.presenter.presentNews(news)
        }
    }
}
