//
//  ArticleDetailsViewController.swift
//  Au10tixTest
//
//  Created by zuri cohen on 5/13/21.
//

import UIKit

class ArticleDetailsViewController: UIViewController {
    
    // MARK: - Parameters
    
    var selectedArticle: Article?
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesctiprion: UITextView!
    @IBOutlet weak var imgMain: UIImageView!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    func setupUI() {
        
        guard let selectedArticle = self.selectedArticle else { return }
        
        self.lblTitle.text          = selectedArticle.title
        self.lblDesctiprion.text    = selectedArticle.description
        self.lblAuthor.text         = selectedArticle.author
        self.lblDate.text           = selectedArticle.publishedAt
        
        if let mainImage            = self.getImageByUrl(imageStringUrl: selectedArticle.urlToImage ?? "") {
            self.imgMain.image      = mainImage
        }
    }
    
    func getImageByUrl(imageStringUrl: String) -> UIImage? {
        
        let imageUrl = URL(string: imageStringUrl)
        if let data = try? Data(contentsOf: imageUrl!) {
            return UIImage(data: data)
        } else {
            return nil
        }
    }
}

