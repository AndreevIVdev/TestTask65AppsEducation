//
//  WelcomeViewController.swift
//  TestTask65AppsEducation
//
//  Created by Илья Андреев on 27.10.2021.
//

import UIKit

final class WelcomeViewController: UIViewController {

    private let backgroundImageView: UIImageView = .init()
    private let loginButton: UIButton = .init()
    private let bikeImageView: UIImageView = .init()
    private let welcomeToBikeAppLabel: UILabel = .init()
    private let createAccountButton: UIButton = .init()
    private let signInWithAppleButton: UIButton = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureBackgroundImageView()
        configureLoginButton()
        configureBikeImageView()
        configureWelcomeToBikeAppLabel()
        configureCreateAccountButton()
        configureSignInWithAppleButton()

    }

    private func configureViewController() {
        view.backgroundColor = .ttBlack
        view.addSubViews(
            backgroundImageView,
            loginButton,
            bikeImageView,
            welcomeToBikeAppLabel,
            createAccountButton,
            signInWithAppleButton
        )
    }

    private func configureBackgroundImageView() {
        backgroundImageView.image = Images.biker
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.contentMode = .scaleToFill
        backgroundImageView.pinToEdges(of: view)
    }

    private func configureLoginButton() {
        var configuration: UIButton.Configuration = .plain()
        var container = AttributeContainer()
        container.font = UIFont(name: "SFProDisplay-Regular", size: 18)!
        container.foregroundColor = .ttCyan
        configuration.attributedTitle = AttributedString("Log in", attributes: container)
        loginButton.configuration = configuration

        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            loginButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }

    @objc private func loginButtonTapped() {

    }

    private func configureBikeImageView() {
        bikeImageView.image = Images.bike
        bikeImageView.translatesAutoresizingMaskIntoConstraints = false
        bikeImageView.contentMode = .scaleToFill
        NSLayoutConstraint.activate([
            bikeImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            bikeImageView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 66)
        ])
    }

    private func configureWelcomeToBikeAppLabel() {
        welcomeToBikeAppLabel.text = "Welcome to bikeapp"
        welcomeToBikeAppLabel.numberOfLines = 0
        welcomeToBikeAppLabel.font = UIFont(name: "SFProDisplay-Light", size: 27)!
        welcomeToBikeAppLabel.textColor = .ttCyan
        welcomeToBikeAppLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            welcomeToBikeAppLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            welcomeToBikeAppLabel.topAnchor.constraint(equalTo: bikeImageView.bottomAnchor, constant: 38)
        ])
    }

    private func configureCreateAccountButton() {
        var configuration: UIButton.Configuration = .bordered()
        var container = AttributeContainer()
        container.font = UIFont(name: "SFProDisplay-Regular", size: 23)!
        container.foregroundColor = .ttCyan
        configuration.cornerStyle = .capsule
        configuration.attributedTitle = AttributedString("Create Account", attributes: container)
        configuration.baseForegroundColor = .ttCyan
        configuration.baseBackgroundColor = .clear
        configuration.background.strokeColor = .ttCyan
        configuration.background.strokeWidth = 1
        createAccountButton.configuration = configuration
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            createAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            createAccountButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -47),
            createAccountButton.heightAnchor.constraint(equalToConstant: 63)
        ])
        createAccountButton.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
    }

    @objc private func createAccountButtonTapped() {
        presentInFullScreen(WhatIsYourNameViewController(), animated: true)
    }

    private func configureSignInWithAppleButton() {
        var configuration: UIButton.Configuration = .filled()
        var container = AttributeContainer()
        container.font = UIFont(name: "SFProDisplay-Regular", size: 23)!
        container.foregroundColor = .ttBlack
        configuration.cornerStyle = .capsule
        configuration.attributedTitle = AttributedString("Sign In with Apple", attributes: container)
        configuration.baseBackgroundColor = .ttCyan
        configuration.baseForegroundColor = .ttBlack
        configuration.image = UIImage(systemName: "applelogo")
        configuration.imagePadding = Constants.padding
        signInWithAppleButton.configuration = configuration

        signInWithAppleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signInWithAppleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            signInWithAppleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            signInWithAppleButton.bottomAnchor.constraint(equalTo: createAccountButton.topAnchor, constant: -10),
            signInWithAppleButton.heightAnchor.constraint(equalToConstant: 63)
        ])
        signInWithAppleButton.addTarget(self, action: #selector(signInWithAppleButtonTapped), for: .touchUpInside)
    }

    @objc private func signInWithAppleButtonTapped() {

    }
}
