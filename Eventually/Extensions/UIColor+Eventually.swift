//
//  UIColor+Eventually.swift
//  Eventually
//
//  Created by David Barsky on 5/27/15.
//  Copyright (c) 2015 David Barsky. All rights reserved.
//

import UIKit

extension UIColor {
    class func primaryTextColor() -> UIColor {
        return UIColor(red:0.353,  green:0.420,  blue:0.467, alpha:1)
    }
    
    class func headerTextColor() -> UIColor {
        return UIColor(red:0.473,  green:0.551,  blue:0.598, alpha:1)
    }
    
    class func headerBackgroundColor() -> UIColor {
        return UIColor(red:0.988,  green:0.992,  blue:1, alpha:1)
    }
    
    class func borderColor() -> UIColor {
         return UIColor(red:0.888,  green:0.892,  blue:0.92, alpha:1)
    }
}
