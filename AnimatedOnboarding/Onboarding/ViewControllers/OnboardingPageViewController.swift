//
//  OnboardingPageViewController.swift
//
//  Created by Eliel Gordon on 1/12/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import UIKit

class OnboardingPageViewController: UIPageViewController {
    
    override func viewDidLoad() {
        dataSource = self
        delegate = self
        
        view.backgroundColor = UIColor.lightBlue()
        
        
        setViewControllers([getStepOne()], direction: .forward, animated: true, completion: nil)
    }
    
    func getStepOne() -> StepOne {
        return storyboard!.instantiateViewController(withIdentifier: "StepOne") as! StepOne
    }
    
    func getStepTwo() -> StepTwo {
        return storyboard!.instantiateViewController(withIdentifier: "StepTwo") as! StepTwo
    }
    
    func getStepThree() -> StepThree {
        return storyboard!.instantiateViewController(withIdentifier: "StepThree") as! StepThree
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// MARK: - UIPageViewControllerDataSource methods

extension OnboardingPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        if viewController is StepThree {
            // 3 -> 2
            return getStepTwo()
        } else if viewController is StepTwo {
            // 2 -> 1
            return getStepOne()
        } else {
            // 0 -> end of the road
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController is StepOne {
            // 1 -> 2
            return getStepTwo()
        } else if viewController is StepTwo {
            // 2 -> 3
            return getStepThree()
        } else {
            // 0 -> end of the road
            return nil
        }
    }
    
    // Enables pagination dots
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    // This only gets called once, when setViewControllers is called
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}

// MARK: - UIPageViewControllerDelegate methods

extension OnboardingPageViewController: UIPageViewControllerDelegate {}
