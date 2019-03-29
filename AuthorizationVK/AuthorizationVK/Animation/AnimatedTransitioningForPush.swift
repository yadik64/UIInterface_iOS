//
//  AnimatedTransitioningForPush.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 28/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class AnimatedTransitioningForPush: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        let containerViewFrame = transitionContext.containerView.frame
        transitionContext.containerView.addSubview(destination.view)
//        destination.view.frame = CGRect(x: containerViewFrame.width - containerViewFrame.height,
//                                        y: -containerViewFrame.height,
//                                        width: containerViewFrame.height,
//                                        height: containerViewFrame.width)
        destination.view.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        let positionX = containerViewFrame.width
        let positionY = containerViewFrame.height
        destination.view.layer.anchorPoint = CGPoint(x: 1, y: 1)
        destination.view.layer.position = CGPoint(x: positionX, y: positionY)
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            destination.view.transform = CGAffineTransform(rotationAngle: 2 * CGFloat.pi)
            
        }) { (finished) in
            destination.view.transform = .identity
            destination.view.frame = CGRect(x: 0, y: 0, width: 414, height: 736)
            transitionContext.completeTransition(finished)
        }
    }
    
}

