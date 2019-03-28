//
//  AnimatedTransitioningForPop.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 28/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class AnimatedTransitioningForPop : NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let sourse = transitionContext.viewController(forKey: .from),
            let destimation = transitionContext.viewController(forKey: .to) else { return }
        
        let containerViewFrame = transitionContext.containerView.frame
        let positionX = containerViewFrame.width
        let positionY = containerViewFrame.height
        sourse.view.layer.anchorPoint = CGPoint(x: 1, y: 1)
        sourse.view.layer.position = CGPoint(x: positionX, y: positionY)
        transitionContext.containerView.insertSubview(destimation.view, at: 0)
        destimation.view.frame = CGRect(x: 0,
                                        y: 0,
                                        width: containerViewFrame.width,
                                        height: containerViewFrame.height)
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            sourse.view.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        }) { (finished) in
            if finished && !transitionContext.transitionWasCancelled {
                sourse.removeFromParent()
            } else if transitionContext.transitionWasCancelled {
                destimation.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
    
}

