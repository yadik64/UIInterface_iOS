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
    
    func animatedFoto() {
        
        let animated = CASpringAnimation(keyPath: "bounds")
        animated.fromValue = self.nameFotoImage.bounds
        let width = self.nameFotoImage.bounds.width
        let height = self.nameFotoImage.bounds.height
        animated.toValue = CGRect(x: 0, y: 0, width: width - 5, height: height - 5)
        animated.damping = 0
        animated.initialVelocity = 5
        animated.stiffness = 1000
        animated.mass = 2
        animated.duration = 0.5
        self.nameFotoImage.layer.add(animated, forKey: nil)
        
    }
    
    @objc func doubleTapped() {
        pressLikeButton(likeButton)
    }
    
    @IBAction func pressLikeButton(_ sender: LikeButton) {
        
        animatedFoto()
        
        if sender.bool {
            likeLabel.text = String(Int(likeLabel.text!)! + 1)
            sender.bool = false
        } else {
            likeLabel.text = String(Int(likeLabel.text!)! - 1)
            sender.bool = true
        }
    }
}
