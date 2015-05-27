//
//  UIView+Eventually.swift
//  Eventually
//
//  Created by David Barsky on 5/27/15.
//  Copyright (c) 2015 David Barsky. All rights reserved.
//

import UIKit

extension UIView {
    func addLabelToCell(label: UILabel, fontName: String, fontSize: CGFloat, textColor: UIColor) {
        self.addSubview(label)
        label.font = UIFont(name: fontName, size: fontSize)
        label.textColor = textColor
    }
}
