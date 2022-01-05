//
//  WhatIsYourEmailViewController.swift
//  TestTask65AppsEducation
//
//  Created by Илья Андреев on 30.10.2021.
//

import UIKit

class WhatIsYourEmailViewController: UIViewController {

    private let whatIsYourEmailLabel: UILabel = .init()
    private let emailTextField: TTTextField = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureWhatIsYourEmailLabel()
        configureEmailTextField()
    }

    private func configureViewController() {
        view.backgroundColor = .ttBlack
        view.addSubViews(
            whatIsYourEmailLabel,
            emailTextField
        )
        view.addGestureRecognizer(
            UITapGestureRecognizer(
                target: view,
                action: #selector(UIView.endEditing))
        )
    }

    private func configureWhatIsYourEmailLabel() {
        whatIsYourEmailLabel.configureAsTitle(
            withText: "What is your Email?",
            inView: view
        )
    }

    private func configureEmailTextField() {
        emailTextField.placeholder = "Email"
        emailTextField.delegate = self

        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            emailTextField.topAnchor.constraint(equalTo: whatIsYourEmailLabel.bottomAnchor, constant: 50)
        ])
    }
}

extension WhatIsYourEmailViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField: presentInFullScreen(CreatePasswordViewController(), animated: true)
        default:
            fatalError()
        }
        return true
    }
}
