//
//  Extensions.swift
//  Au10tixTest
//
//  Created by zuri cohen on 5/11/21.
//


import Foundation

extension NSObject {
    
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
