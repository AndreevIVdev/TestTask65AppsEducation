//
//  Constants.swift
//  TestTask65AppsEducation
//
//  Created by Илья Андреев on 27.10.2021.
//

import UIKit

enum Images {

    static let biker: UIImage = .init(named: "Biker")!
    static let bike: UIImage = .init(named: "Bike")!
    static let forward: UIImage = .init(
        systemName: "chevron.forward.circle",
        withConfiguration: UIImage.SymbolConfiguration(
            font: UIFont.systemFont(
                ofSize: 30
            )
        )
    )!
    static let showPassword: UIImage = .init(systemName: "eye.circle")!
    static let dontShowPassword: UIImage = .init(systemName: "eye.slash.circle")!
}

enum Constants {

    static let padding: CGFloat = 16
}
