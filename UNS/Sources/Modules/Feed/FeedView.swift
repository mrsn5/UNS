//
//  FeedView.swift
//  UNS
//
//  Created by San Byn Nguyen on 28.12.2019.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit
import os.log

class FeedView: UIViewController, ViewProtocol, Storyboarded {
    
    // MARK:- Properties
    var presenter: FeedPresenterViewProtocol!
    
    @IBOutlet weak var feedTable: UITableView!
    var feedDelegate = FeedDataSource()
    
    // MARK:- Lifecycle
    override func viewDidLoad() {
        os_log("FeedView.viewDidLoad()", log: .lifecycle, type: .info)
        super.viewDidLoad()
        self.presenter.start()
        feedDelegate.view = self
        feedTable.dataSource = feedDelegate
        feedTable.delegate = feedDelegate
    }
    
    func selectedNews(_ news: News) {
        presenter.showArticle(news)
    }
    
}

extension FeedView: FeedViewPresenterProtocol {
    func showNews(_ news: [News]) {
        feedDelegate.news = news
        feedTable.reloadData()
    }
    
    func setup() {
        let cellNib = UINib(nibName: "NewsCell", bundle: nil)
        self.feedTable.register(cellNib, forCellReuseIdentifier: "NewsCell")
        self.feedTable.reloadData()
    }
}


