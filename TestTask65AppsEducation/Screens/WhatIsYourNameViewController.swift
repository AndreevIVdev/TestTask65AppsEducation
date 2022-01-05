//
//  WhatIsYourNameViewController.swift
//  TestTask65AppsEducation
//
//  Created by Илья Андреев on 28.10.2021.
//

import UIKit

final class WhatIsYourNameViewController: UIViewController {

    private let whatIsYourNameLabel: UILabel = .init()
    private let firstNameTextField: TTTextField = .init()
    private let lastNameTextField: TTTextField = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureWhatIsYourNameLabel()
        configureFirstNameTextField()
        configureLastNameTextField()
    }

    private func configureViewController() {
        view.backgroundColor = .ttBlack
        view.addSubViews(
            whatIsYourNameLabel,
            firstNameTextField,
            lastNameTextField
        )
        view.addGestureRecognizer(
            UITapGestureRecognizer(
                target: view,
                action: #selector(UIView.endEditing))
        )
    }

    private func configureWhatIsYourNameLabel() {
        whatIsYourNameLabel.configureAsTitle(
            withText: "What is your name?",
            inView: view
        )
    }

    private func configureFirstNameTextField() {
        firstNameTextField.delegate = self
        firstNameTextField.placeholder = "First name"
        firstNameTextField.font = UIFont(name: "SFProDisplay-Light", size: 24)!
        firstNameTextField.secondaryFont = UIFont(name: "SFProDisplay-Light", size: 14)!

        firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            firstNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            firstNameTextField.topAnchor.constraint(equalTo: whatIsYourNameLabel.bottomAnchor, constant: 50)
        ])
    }

    private func configureLastNameTextField() {
        lastNameTextField.delegate = self
        lastNameTextField.placeholder = "Last name"
        lastNameTextField.font = UIFont(name: "SFProDisplay-Light", size: 24)!
        lastNameTextField.secondaryFont = UIFont(name: "SFProDisplay-Light", size: 14)!

        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lastNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            lastNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            lastNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 20)
        ])
    }
}

extension WhatIsYourNameViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstNameTextField: lastNameTextField.becomeFirstResponder()
        case lastNameTextField: presentInFullScreen(WhatIsYourEmailViewController(), animated: true)
        default:
            fatalError()
        }
        return true
    }
}
