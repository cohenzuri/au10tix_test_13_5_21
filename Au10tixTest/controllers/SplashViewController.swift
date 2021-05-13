//
//  SplashViewController.swift
//  Au10tixTest
//
//  Created by zuri cohen on 5/13/21.
//

import UIKit

class SplashViewController: UIViewController {
    
    // MARK: - Parameters
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getArticles()
    }
    
    func getArticles() {
        
        NetworkingManager.sheredInstance.downloadJson { articles in
           
            DispatchQueue.main.async {
                self.goToNextVc(withData: articles)
            }
        }
    }
    
    func goToNextVc(withData: [Article]) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() ) {
            
            if let destinationVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: ArticlesListViewController.className) as? ArticlesListViewController {
                
                destinationVC.articlesArray = withData
                
                self.navigationController?.pushViewController(destinationVC, animated: true)
            }
        }
    }
}




