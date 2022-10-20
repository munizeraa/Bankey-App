//
//  ViewCodeContract.swift
//  Bankey
//
//  Created by Philippe Muniz Gomes on 18/09/22.
//

import Foundation

protocol ViewCodeContract: AnyObject {
    func setupViews()
    func setupHierarchy()
    func setupConstraints()
}

extension ViewCodeContract {
    func setupViews() {
        setupHierarchy()
        setupConstraints()
    }
}
