//
//  WelcomeViewController.swift
//  TestTask65AppsEducation
//
//  Created by Илья Андреев on 27.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    private let backgroundImageView: UIImageView = .init(image: Images.biker)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureBackgroundImageView()
    }
    
    private func configureViewController() {
        view.backgroundColor = .aeBlack()
        view.addSubViews(backgroundImageView)
    }
    
    private func configureBackgroundImageView() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.contentMode = .scaleToFill
        backgroundImageView.pinToEdges(of: view)
    }
}
