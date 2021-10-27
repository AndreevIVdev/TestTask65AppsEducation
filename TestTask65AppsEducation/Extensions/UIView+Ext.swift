//
//  UIView+Ext.swift
//  GHProfile
//
//  Created by Ilya Andreev on 09.09.2021.
//

import UIKit

extension UIView {
    
    func addSubViews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
    
    func pinToEdges(of superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            topAnchor.constraint(equalTo: superView.topAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
    }
    
    var width: CGFloat {
        frame.size.width
    }
    
    var height: CGFloat {
        frame.size.height
    }
    
    var left: CGFloat {
        frame.origin.x
    }
    
    var right: CGFloat {
        left + width
    }
    
    var top: CGFloat {
        frame.origin.y
    }
    
    var bottom: CGFloat {
        top + height
    }
}
