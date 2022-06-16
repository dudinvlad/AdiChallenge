//
//  BaseNavigationController.swift
//  Adidas
//
//  Created by Vladislav Dudin on 15.06.2022.
//

import UIKit

final class BaseNavigationController: UINavigationController {

    // MARK: - Init

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.configurate()
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func configurate() {
        navigationBar.prefersLargeTitles = true
        modalPresentationStyle = .currentContext
    }
}
