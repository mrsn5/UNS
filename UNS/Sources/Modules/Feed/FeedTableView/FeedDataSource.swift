//
//  FeedDataSource.swift
//  UNS
//
//  Created by San Byn Nguyen on 17.01.2020.
//  Copyright © 2020 San Byn Nguyen. All rights reserved.
//

import UIKit

class FeedDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    var news = [News]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as? NewsCell else { return UITableViewCell() }
        cell.configure(news: news[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
}
