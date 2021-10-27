//
//  UIColor+Ext.swift
//  GHProfile
//
//  Created by Ilya Andreev on 09.08.2021.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }

    convenience init(rgb: Int, a: CGFloat = 1.0) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            a: a
        )
    }
    
    static func aeBlack() -> UIColor {
        UIColor(rgb: 0x121212)
    }
    
    static func aeCyan() -> UIColor {
        UIColor(rgb: 0x50E3C2)
    }
}

