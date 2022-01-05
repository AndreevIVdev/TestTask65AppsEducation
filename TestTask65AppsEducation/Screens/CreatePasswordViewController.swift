//
//  CreatePasswordViewController.swift
//  TestTask65AppsEducation
//
//  Created by Илья Андреев on 31.10.2021.
//

import UIKit

class CreatePasswordViewController: UIViewController {

    private let createPasswordLabel: UILabel = .init()
    private let passwordTextField: TTTextField = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCreatePasswordLabel()
        configurePasswordTextField()
    }

    private func configureViewController() {
        view.backgroundColor = .ttBlack
        view.addSubViews(
            createPasswordLabel,
            passwordTextField
        )
        view.addGestureRecognizer(
            UITapGestureRecognizer(
                target: view,
                action: #selector(UIView.endEditing))
        )
    }

    private func configureCreatePasswordLabel() {
        createPasswordLabel.configureAsTitle(
            withText: "Create a password",
            inView: view
        )
    }

    private func configurePasswordTextField() {
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.addPasswordSecureButton()

        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            passwordTextField.topAnchor.constraint(equalTo: createPasswordLabel.bottomAnchor, constant: 50)
        ])
    }
}
