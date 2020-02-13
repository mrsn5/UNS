//
//  FeedRouter.swift
//  UNS
//
//  Created by San Byn Nguyen on 28.12.2019.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit

class FeedRouter: RouterProtocol {
    weak var presenter: FeedPresenterRouterProtocol!
    weak var viewController: UIViewController?
}


extension FeedRouter: FeedRouterPresenterProtocol {
    func routeArticle(_ news: News) {
        let articleView = ArticleModule().build(news)
        viewController?.present(articleView, animated: true, completion: nil)
    }
}
