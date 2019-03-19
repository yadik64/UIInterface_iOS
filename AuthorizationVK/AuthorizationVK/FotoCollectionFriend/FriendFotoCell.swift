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
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        self.addGestureRecognizer(tap)
        
    }
    
    @objc func doubleTapped() {
        pressLikeButton(likeButton)
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
