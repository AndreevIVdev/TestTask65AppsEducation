//
//  UITextField+Ext.swift
//  TestTask65AppsEducation
//
//  Created by Илья Андреев on 28.10.2021.
//

import UIKit

extension UITextField {

    var isEmpty: Bool {
        text?.isEmpty ?? true
    }

    var isActive: Bool {
        isFirstResponder || !isEmpty
    }
}
