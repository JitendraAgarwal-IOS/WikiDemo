//
//  WikiSearchCell.swift
//  WikipediaDemo
//
//  Created by Agarwal, JitendraKumar on 6/24/18.
//  Copyright © 2018 Agarwal, JitendraKumar. All rights reserved.
//

import UIKit

class WikiSearchCell: UITableViewCell {

    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
     var datasource: AnyObject? {
        didSet {
            if self.datasource != nil{
              let objPages = self.datasource as! Pages
                
                self.lblTitle.text = objPages.title
                self.lblDesc.text = objPages.terms?.desItems![0]
                
                if let _ = objPages.thumbnail {
                    imgView.setImage(withURL: URL(string: (objPages.thumbnail?.imgURL!)!)!, placeHolderImageNamed: "noImage", andImageTransition: .crossDissolve(0.4))
                }
                
                
                
                
             
                
                
                
            }
        }
        
    }
}
