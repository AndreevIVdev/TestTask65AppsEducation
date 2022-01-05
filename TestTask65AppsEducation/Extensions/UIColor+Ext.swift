//
//  UIColor+Ext.swift
//  GHProfile
//
//  Created by Ilya Andreev on 09.08.2021.
//

import UIKit

extension UIColor {

    convenience init(red: Int, green: Int, blue: Int, alpa: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: alpa
        )
    }

    convenience init(rgb: Int, alpa: CGFloat = 1.0) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            alpa: alpa
        )
    }

    static let ttBlack: UIColor = .init(rgb: 0x121212)

    static let ttCyan: UIColor = .init(rgb: 0x50E3C2)

    static let inactive: UIColor = .gray
}
