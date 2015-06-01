//
//  UIFont+Eventually.swift
//  Eventually
//
//  Created by David Barsky on 5/31/15.
//  Copyright (c) 2015 David Barsky. All rights reserved.
//

import UIKit

extension UIFont {
    
    enum FontWeight {
        case Light, Regular
    }
    
    class func appFont(weight: FontWeight) -> String {
        let lightFont = "AktivGroteskTrial-Light"
        let regularFont = "AktivGroteskTrial-Regular"
        
        switch weight {
        case .Light:
            return lightFont
        case .Regular:
            return regularFont
        }
    }
}
