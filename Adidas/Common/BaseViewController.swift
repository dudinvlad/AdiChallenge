//
//  BaseViewController.swift
//  Adidas
//
//  Created by Vladislav Dudin on 15.06.2022.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetup()
    }

    // MARK: - Privat
    private func initialSetup() {
        view.backgroundColor = .white
        tapToCloseKeyboard()
    }

    private func tapToCloseKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}
