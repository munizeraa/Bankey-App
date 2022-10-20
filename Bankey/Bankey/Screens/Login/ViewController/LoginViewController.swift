//
//  LoginViewController.swift
//  Bankey
//
//  Created by Philippe Muniz Gomes on 18/09/22.
//

import UIKit

protocol LoginDelegate: AnyObject {
    func login()
}

class LoginViewController: UIViewController {

    private let loginView = LoginView()
    private let loginButton = UIButton()
    private let errorMessageLabel = UILabel()
    private var username: String? {
        return self.loginView.usernameTextField.text
    }

    private var password: String? {
        return self.loginView.passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        layout()
    }
}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white

        // MARK: - Login Button

        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.configuration = .filled()
        loginButton.configuration?.imagePadding = 8
        loginButton.setTitle("Sign In", for: [])
        loginButton.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)

        // MARK: - Error Message Label

        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.isHidden = true

        view.addSubview(loginView)
        view.addSubview(loginButton)
        view.addSubview(errorMessageLabel)
    }

    private func layout() {

        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),

            loginButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            loginButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 58),

            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: loginButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),

        ])

    }
}

// MARK: - Login Delegate

extension LoginViewController {
    @objc
    func login(_ sender: UIButton) {
        errorMessageLabel.isHidden = true
        handleLogin()
    }

    private func handleLogin() {
        guard let username = self.username, let password = self.password
        else {
            assertionFailure("Login Error: Username and Password cannot be empty")
            return
        }

        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username and Password cannot be empty")
            return
        }

        if username == "123" && password == "123" {
            loginButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect Username / Password")
        }
    }

    private func configureView(withMessage message: String) {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
    }
}
