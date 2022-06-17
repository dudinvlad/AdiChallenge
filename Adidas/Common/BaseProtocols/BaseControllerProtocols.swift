//
//  BaseControllerProtocols.swift
//  Adidas
//
//  Created by Vladislav Dudin on 16.06.2022.
//

import UIKit

// MARK: - BaseControllerInput -

protocol BaseControllerInput: AnyObject {
    func showNetworking(error text: String?)
    func showNetworking(info text: String?)
    func showActivity()
    func hideActivity()
    func showActivity(delay: CGFloat)
}

extension BaseControllerInput where Self: UIViewController {
    func showNetworking(error text: String?) {
        NetworkingMassage.showMassege(viewController: self, text: text, style: .failure)
    }

    func showNetworking(info text: String?) {
        NetworkingMassage.showMassege(viewController: self, text: text, style: .success)
    }

    func showActivity(delay: CGFloat) {
        showActivity()
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.hideActivity()
        }
    }

    func showActivity() {
        DispatchQueue.main.async {
            NetworkingActivity.show(viewController: self, color: .cyan, type: .circleStrokeSpin)
        }
    }

    func hideActivity() {
        DispatchQueue.main.async {
            NetworkingActivity.hide()
        }
    }
}

// MARK: - BaseControllerOutput -

protocol BaseControllerOutput: AnyObject {
    func didLoad()
    func didAppear()
    func didDisappear()
    func willAppear()
    func willDisappear()
}

extension BaseControllerOutput {
    func didLoad() {}
    func didAppear() {}
    func didDisappear() {}
    func willAppear() {}
    func willDisappear() {}
}
