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
    }
}
