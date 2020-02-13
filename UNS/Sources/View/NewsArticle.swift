//
//  NewsArticle.swift
//  UNS
//
//  Created by San Byn Nguyen on 12.02.2020.
//  Copyright © 2020 San Byn Nguyen. All rights reserved.
//

import UIKit

@IBDesignable
class NewsArticle: UIView {

    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    func setup() {
    articleText.translatesAutoresizingMaskIntoConstraints = true
        articleTitle.sizeToFit()
        articleText.isScrollEnabled = false
    }
    
    func configure(news: News) {
        articleText.text = news.content
        articleTitle.text = news.title
        news.getImage { data in
            if data == nil {
                self.articleImage.image = UIImage(named: "logo-banner")
            } else {
                self.articleImage.image = data
            }
        }
    }

}
