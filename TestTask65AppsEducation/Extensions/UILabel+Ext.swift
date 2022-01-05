//
//  UILabel+Ext.swift
//  TestTask65AppsEducation
//
//  Created by Илья Андреев on 30.10.2021.
//

import UIKit

extension UILabel {

    func configureAsTitle(withText text: String, inView view: UIView) {
        self.text = text
        numberOfLines = 0
        font = UIFont(name: "SFProDisplay-Regular", size: 32)!
        textColor = .ttCyan
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            topAnchor.constraint(equalTo: view.topAnchor, constant: 92)
        ])
    }
}
