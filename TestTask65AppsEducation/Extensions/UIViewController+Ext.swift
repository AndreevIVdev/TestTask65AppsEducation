//
//  UIViewController+Ext.swift
//  TestTask65AppsEducation
//
//  Created by Илья Андреев on 28.10.2021.
//

import UIKit

extension UIViewController {

    func presentInFullScreen(_ viewController: UIViewController,
                             animated: Bool,
                             completion: (() -> Void)? = nil) {
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: animated, completion: completion)
    }
}
