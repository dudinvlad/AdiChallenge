//
//  ProductDetailsPresenter.swift
//  Adidas
//
//  Created Vladislav Dudin on 16.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

private typealias Module = ProductDetailsModule
private typealias Presenter = Module.Presenter

extension Module {
    final class Presenter {
        // MARK: - Dependencies

        weak var view: ViewInput!
        var interactor: InteractorInput!
        var router: RouterInput!
        var product: ProductModel?

        // MARK: - Variables

        private var dataSource: [ProductReviewModel] = .init()

        required init(productItem: ProductModel?) {
            self.product = productItem
        }

    }
}

private extension Presenter { }

extension Presenter: Module.ViewOutput {
    func getProductReviews() -> [ProductReviewModel] {
        dataSource
    }
    func showAddReviewScreen() {
        router.presentAddReviewScren(with: product)
    }
}

extension Presenter: Module.InteractorOutput {
    func gotProductReviews(_ items: [ProductReviewModel]) {
        view.hideActivity()
        dataSource = items
        view.reloadData()
    }

    func failure(with error: String) {
        view.hideActivity()
        view.showNetworking(error: error)
    }

    func didLoad() {
        guard let productId = product?.id else { return }

        view.showActivity()
        interactor.retrieveProductReviews(productId)
    }
}
