//
//  StepThree.swift
//
//  Created by Eliel Gordon on 1/12/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import UIKit
import CoreLocation

class StepThree: UIViewController {
    
    @IBOutlet var imageViews: [UIImageView]!
    
    @IBOutlet weak var imageTextStackView: UIStackView!
    
    @IBOutlet weak var getStartedButton: DesignableButton!
    @IBOutlet var labels: [UILabel]!
    
    func animateViews() {
        
        let getStartedAnimation = {
            self.getStartedButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }
        
        imageTextStackView.axis = .horizontal
        
        let animations = {
            self.imageTextStackView.axis = .vertical
            
            self.imageViews.forEach { imageView in
                imageView.transform = CGAffineTransform.identity
                imageView.alpha = 1
            }
            self.labels.forEach { label in
                label.alpha = 1
            }
            self.view.layoutIfNeeded()
        }
        
        imageViews.forEach { imageView in
            imageView.transform = CGAffineTransform(rotationAngle: 180)
            imageView.alpha = 0
        }
        
        labels.forEach { label in
            label.alpha = 0
        }
        
        ThrottleHelper.throttle(seconds: 0.4) {
            UIView.animate(withDuration: 1.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity:0.7, options: .curveEaseInOut, animations: animations, completion: nil)
        }
        
        UIView.animate(withDuration: 1.5, delay: 2, options: [.autoreverse, .repeat, .allowUserInteraction, .curveEaseInOut], animations: getStartedAnimation, completion: nil)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateViews()
    }
}
