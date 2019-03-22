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
    @IBOutlet weak var likeView: LikeView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        likeView.bounds = CGRect(x: 0, y: 0, width: 20, height: 20)
        likeView.layer.opacity = 0
        
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
    
    func addLikeAnimation() {
        
        let duration = 1.0
        
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: [.calculationModeCubic], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5/duration, animations: {
                self.likeView.bounds = CGRect(x: 0, y: 0, width: 150, height: 150)
            })
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5/duration, animations: {
                self.likeView.layer.opacity = 1
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                self.likeView.layer.opacity = 0
            })
        }, completion: nil)
        
    }
    
    @objc func doubleTapped() {
        pressLikeButton(likeButton)
    }
    
    @IBAction func pressLikeButton(_ sender: LikeButton) {
        
        if sender.bool {
            addLikeAnimation()
            likeLabel.text = String(Int(likeLabel.text!)! + 1)
            sender.bool = false
        } else {
            animatedFoto()
            likeLabel.text = String(Int(likeLabel.text!)! - 1)
            sender.bool = true
        }
    }
}
