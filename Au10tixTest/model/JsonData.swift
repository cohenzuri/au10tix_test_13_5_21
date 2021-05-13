//
//  JsonData.swift
//  Au10tixTest
//
//  Created by zuri cohen on 5/13/21.
//

import Foundation

struct JsonData: Decodable {

    var articles: [Article]

    init() {
        articles = [Article]()
    }
}
