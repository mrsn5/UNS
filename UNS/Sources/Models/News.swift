//
//  News.swift
//  UNS
//
//  Created by San Byn Nguyen on 05.01.2020.
//  Copyright © 2020 San Byn Nguyen. All rights reserved.
//

import Foundation

struct News {
    public let source: String
    public let author: String
    public let title: String
    public let description: String
    public let url: URL
    public let imageUrl: URL?
    public let publishedAt: Date
    public let content: String
}
