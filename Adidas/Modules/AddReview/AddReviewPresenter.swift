//
//  AddReviewPresenter.swift
//  Adidas
//
//  Created Vladislav Dudin on 17.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

private typealias Module = AddReviewModule
private typealias Presenter = Module.Presenter

extension Module {
    final class Presenter {
        // MARK: - Dependencies

        weak var view: ViewInput!
        var interactor: InteractorInput!
        var router: RouterInput!
        var product: ProductModel?

        required init(product: ProductModel?) {
            self.product = product
        }

    }
}

private extension Presenter { }

extension Presenter: Module.ViewOutput { }

extension Presenter: Module.InteractorOutput {
    func failure(with error: String) {
        view.hideActivity()
        view.showNetworking(error: error)
    }

    func success() {
        view.hideActivity()
        router.close()
    }

    func sendReview(with text: String?, rating: String?) {
        guard
            let reviewText = text,
            let reviewRating = Int(rating ?? "")
        else {
            return
        }

        view.showActivity()
        interactor.sendReview(with: reviewText, rating: reviewRating, productId: product?.id)
    }
}
