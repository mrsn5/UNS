//
//  ArticleCell.swift
//  UNS
//
//  Created by San Byn Nguyen on 13.02.2020.
//  Copyright © 2020 San Byn Nguyen. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var paragraphLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(_ paragraph: String) {
//        let data = Data(paragraph.utf16)
//        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
//            paragraphLabel.attributedText = attributedString
//        } else {
            paragraphLabel.text = paragraph
//        }
    }

}
