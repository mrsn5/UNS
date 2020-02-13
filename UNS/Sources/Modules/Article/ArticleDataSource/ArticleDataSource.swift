//
//  ArticleDataSource.swift
//  UNS
//
//  Created by San Byn Nguyen on 13.02.2020.
//  Copyright © 2020 San Byn Nguyen. All rights reserved.
//

import UIKit

class ArticleDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var title: String = ""
    var paragraphs = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paragraphs.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTitleCell") as? ArticleCell else { return UITableViewCell() }
            cell.configure(title)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ParagraphCell") as? ArticleCell else { return UITableViewCell() }
            cell.configure(paragraphs[indexPath.row - 1])
            return cell
        }
    }
}
