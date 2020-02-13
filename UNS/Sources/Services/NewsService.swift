//
//  NewsService.swift
//  UNS
//
//  Created by San Byn Nguyen on 05.01.2020.
//  Copyright © 2020 San Byn Nguyen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import os.log

protocol NewsService: class {
    func loadTopHeadlines(completion: @escaping ([News]?) -> ())
}

let NEWS_API_KEY = "09794063f6844addb06423a59e458c9a"
let NEWS_API_URL = "https://newsapi.org/v2/"
let UA_TOP_HEADLINES = NEWS_API_URL + "top-headlines"

class NewsAPIService: NewsService {
    func loadTopHeadlines(completion:  @escaping ([News]?) -> ()) {
        os_log("Top Headlines loaded", log: .service, type: .info)
        
        guard let url = URL(string: UA_TOP_HEADLINES) else {
            completion(nil)
            return
        }
        
        request(url,
               method: .get,
               parameters: ["country": "ua", "apiKey": NEWS_API_KEY]
        )
            .validate()
            .responseJSON { response in
                switch response.result {
                    
                case .success(let data):
                    guard let json = JSON(rawValue: data) else { return }
                    var news = [News]()
                    for article in json["articles"].arrayValue {
                        let n = News(
                            source: article["source"]["name"].stringValue,
                            author: article["author"].stringValue,
                            title: article["title"].stringValue,
                            description: article["description"].stringValue,
                            url: URL(string: article["url"].stringValue),
                            imageUrl: URL(string: article["urlToImage"].stringValue),
                            publishedAt: article["publishedAt"].date,
                            content: article["content"].stringValue.replacingOccurrences(of: "\n\n", with: "\n"))
                        news.append(n)
                    }
                
                    completion(news)
                case .failure(let error):
                    os_log(.error, log: .service, "NewsAPI: {PUBLIC}", error.localizedDescription.description)
                    completion(nil)
                }
        }
    }
}
