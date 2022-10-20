//
//  LoginView.swift
//  Bankey
//
//  Created by Philippe Muniz Gomes on 15/10/22.
//

import Foundation
import UIKit

final class LoginView: UIView {
    
    // MARK: - Private Properties

    private let stackView = UIStackView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    private let dividerView = UIView()
    private let loginButton = UIButton()

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - UI Functions

extension LoginView {

    // MARK: - Public Methods

    func style() {

        // MARK: - LoginView

        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 5
        clipsToBounds = true

        // MARK: - Username TextField

        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self

        // MARK: - Password TextField

        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self

        // MARK: - Divider

        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill

        // MARK: - StackView

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8

        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)

        addSubview(stackView)
    }

    func layout() {

        // MARK: - Constraints

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

// MARK: - TextField Delegates

extension LoginView: UITextFieldDelegate {

    // MARK: - Public Methods

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            return false
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
