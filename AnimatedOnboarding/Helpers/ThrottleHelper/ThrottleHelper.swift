//
//  ThrottleHelper.swift
//
//  Created by Eliel Gordon on 1/12/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import UIKit

class ThrottleHelper {
    
    // helper function to delay whatever's in the callback
    class func throttle(seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
    }
}
