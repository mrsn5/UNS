//
//  ArticleView.swift
//  UNS
//
//  Created by San Byn Nguyen on 12.02.2020.
//  Copyright © 2020 San Byn Nguyen. All rights reserved.
//

import UIKit

class ArticleView: UIViewController, ViewProtocol, Storyboarded {
    
    // MARK:- Properties
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var tableDelegate = ArticleDataSource()
    
    var presenter: ArticlePresenterViewProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = tableDelegate
        tableView.delegate = tableDelegate
        presenter.start()
    }
}


extension ArticleView: ArticleViewPresenterProtocol {
    func setup(_ news: News) {
        news.getImage { (image) in
            guard let image = image else {return}
            self.articleImage.image = image
        }
        tableDelegate.title = news.title
        tableDelegate.paragraphs = news.description.components(separatedBy: CharacterSet.newlines).filter({ !$0.isEmpty })
    }
    
}
