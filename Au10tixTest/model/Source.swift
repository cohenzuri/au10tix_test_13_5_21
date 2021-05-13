//
//  Source.swift
//  Au10tixTest
//
//  Created by zuri cohen on 5/13/21.
//

import Foundation

class Source: Decodable {
  
    let id  : String?
    let name: String
    
    init(id: String?, name: String) {
        self.id     = id
        self.name   = name
    }
}
