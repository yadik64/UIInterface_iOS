//
//  NewsTableFooter.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 17/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class NewsTableFooter: UITableViewHeaderFooterView {

    @IBOutlet weak var likeButton: LikeButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var viewedCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
   
        
    }
    
    @IBAction func pressLikeButton(_ sender: LikeButton) {
        
        if sender.bool {
            likeLabel.text = String(Int(likeLabel.text!)! + 1)
            sender.bool = false
        } else {
            likeLabel.text = String(Int(likeLabel.text!)! - 1)
            sender.bool = true
        }
        
    }
}
