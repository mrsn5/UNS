//
//  News.swift
//  UNS
//
//  Created by San Byn Nguyen on 05.01.2020.
//  Copyright © 2020 San Byn Nguyen. All rights reserved.
//

import Foundation
import SwiftyJSON

class News {
    public let source: String
    public let author: String
    public let title: String
    public let description: String
    public let url: URL?
    public let imageUrl: URL?
    public let publishedAt: Date?
    public let content: String
    
    init(source: String, author: String, title: String, description: String, url: URL?, imageUrl: URL?, publishedAt: Date?, content: String) {
        self.source = source
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.imageUrl = imageUrl
        self.publishedAt = publishedAt
        self.content = content
    }
    
    private var image: Data?
    
    func getImage(completion: @escaping (Data) -> ()) {
        if let image = image {
            completion(image)
        } else {
            DispatchQueue.global(qos: .background).async {
                if let imageURL = self.imageUrl, let data = try? Data(contentsOf: imageURL) {
                    self.image = data
                    DispatchQueue.main.async {
                        completion(data)
                    }
                }
            }
        }
    }
}
