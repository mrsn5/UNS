//
//  NewsCell.swift
//  UNS
//
//  Created by San Byn Nguyen on 20.01.2020.
//  Copyright © 2020 San Byn Nguyen. All rights reserved.
//

import UIKit

@IBDesignable
class NewsCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(news: News) {
        newsTitle.text = news.title
        newsImage.image = nil
        news.getImage { data in
            if data == nil {
                self.newsImage.image = UIImage(named: "logo-banner")
            } else {
                self.newsImage.image = data
            }
        }
    }
    
}
