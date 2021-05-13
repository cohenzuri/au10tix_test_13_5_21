//
//  Article.swift
//  Au10tixTest
//
//  Created by zuri cohen on 5/11/21.
//

import Foundation

class Article: Decodable {
  
    let source      : Source
    let author      : String?
    let title       : String
    let description : String
    let url         : String
    let urlToImage  : String?
    let publishedAt : String
    
    init(source: Source, author: String?, title: String, description: String, url: String, urlToImage: String?, publishedAt: String) {
        
        self.source      = source
        self.author      = author
        self.title       = title
        self.description = description
        self.url         = url
        self.urlToImage  = urlToImage
        self.publishedAt = publishedAt
    }
}

