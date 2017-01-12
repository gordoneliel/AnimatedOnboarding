//
//  StepOne.swift
//
//  Created by Eliel Gordon on 1/12/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import UIKit

class StepOne: UIViewController {
    @IBOutlet var imageViews: [UIImageView]!
    
    @IBOutlet weak var imagesStackView: UIStackView!
    
    @IBOutlet var labels: [UILabel]!
    
    func animateViews() {
        imagesStackView.axis = .vertical
        
        let animations = {
            self.imagesStackView.axis = .horizontal
            self.imagesStackView.transform =  CGAffineTransform.identity
            self.imagesStackView.alpha = 1

            self.labels.forEach { label in
                label.alpha = 1
            }
            self.view.layoutIfNeeded()
        }
        
        // Original state
        imagesStackView.transform = CGAffineTransform(scaleX: 0, y: 0)
        imagesStackView.alpha = 0
        
        labels.forEach { label in
            label.alpha = 0
        }
        
        // Animate all the things!
        ThrottleHelper.throttle(seconds: 0.4) {
            
            UIView.animate(withDuration: 1.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity:0.7, options: .curveEaseInOut, animations: animations, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateViews()
    }
}
