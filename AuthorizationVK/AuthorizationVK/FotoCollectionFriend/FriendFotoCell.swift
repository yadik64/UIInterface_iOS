//
//  FriendFotoCell.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 07/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class FriendFotoCell: UICollectionViewCell {
    
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var likeButton: LikeButton!
    @IBOutlet weak var nameFotoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    
    @IBAction func pressLikeButton(_ sender: LikeButton) {
        
        if sender.bool {
            sender.bool = false
        } else {
            sender.bool = true
        }
        
        if sender.bool {
            likeLabel.text = String(Int(likeLabel.text!)! - 1)
        } else {
            likeLabel.text = String(Int(likeLabel.text!)! + 1)
        }
    }
}
