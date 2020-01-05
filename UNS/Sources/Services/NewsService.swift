//
//  NewsService.swift
//  UNS
//
//  Created by San Byn Nguyen on 05.01.2020.
//  Copyright © 2020 San Byn Nguyen. All rights reserved.
//

import Foundation
import os.log

protocol NewsService: class {
    func loadTopHeadlines() -> [News]
}

let NEWS_API_KEY = "09794063f6844addb06423a59e458c9a"
let NEWS_API_URL = "https://newsapi.org/v2/"
let UA_TOP_HEADLINES = NEWS_API_URL + "top-headlines?country=ua&apiKey=" + NEWS_API_KEY

class NewsAPIService: NewsService {
    func loadTopHeadlines() -> [News] {
        os_log("Top Headlines loaded", log: .service, type: .info)
        return [News]()
    }
}
