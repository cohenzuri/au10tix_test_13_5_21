//
//  NetworkingManager.swift
//  Au10tixTest
//
//  Created by zuri cohen on 5/11/21.
//

import Foundation

class NetworkingManager {
    
    static let sheredInstance = NetworkingManager()
    
    func downloadJson(complition: @escaping ([Article]) -> ()) {
        
        let jsonUrlString = "https://newsapi.org/v2/everything?q=tesla&from=2021-04-13&sortBy=publishedAt&apiKey=467e2d3d2938489bb1184b203edad265"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) {
            (data, response, err) in
            
            guard let data = data else { return }
            
            do {
                
                var jsonData = JsonData()
                jsonData = try JSONDecoder().decode(JsonData.self, from: data)
                
                complition(jsonData.articles)
                
            } catch let jsonErr {
                print("Error serializing json: \(jsonErr)")
            }
            
        }.resume()
    }
}













