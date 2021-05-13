//
//  ArticlesListViewController.swift
//  Au10tixTest
//
//  Created by zuri cohen on 5/11/21.
//

import UIKit

class ArticlesListViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Parameters
    
    var articlesArray = [Article]()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    func setupUI() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.registerNibs()
        self.tableView.reloadData()
    }
    
    func registerNibs() {
        self.tableView.register(UINib(nibName: ArticleTableViewCell.className, bundle: nil), forCellReuseIdentifier: ArticleTableViewCell.className)
    }
    
    // MARK: - IB Actions
    
}

// MARK: - UITableViewDataSource

extension ArticlesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articlesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.className, for: indexPath) as! ArticleTableViewCell
        
        cell.lblTitle.text = self.articlesArray[indexPath.row].title
        cell.lblSubTitle.text = self.articlesArray[indexPath.row].publishedAt
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index =  indexPath.row
        let selectedArticale = self.articlesArray[index]
        
        if let destinationVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: ArticleDetailsViewController.className) as? ArticleDetailsViewController {
            
            destinationVC.selectedArticle = selectedArticale
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(destinationVC, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
}





