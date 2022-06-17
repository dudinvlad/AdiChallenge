//
//  AddReviewInteractor.swift
//  Adidas
//
//  Created Vladislav Dudin on 17.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

private typealias Module = AddReviewModule
private typealias Interactor = Module.Interactor

extension Module {
    final class Interactor {
        // MARK: - Dependencies

        weak var output: InteractorOutput!
        private let productReviewService: ProductReviewService

        required init(productReviewService: ProductReviewService) {
            self.productReviewService = productReviewService
        }

    }
}

extension Interactor: Module.InteractorInput {
    func sendReview(with text: String, rating: Int, productId: String?) {
        guard
            NetworkClient.isConnectedToInternet()
        else {
            output.failure(with: ProductsModule.Localize.noInternetError.localized)
            return
        }

        let reviewModel = ProductReviewModel(productId: productId, locale: "en", rating: rating, text: text)
        productReviewService.sendProductReview(review: reviewModel) { [weak self] result in
            switch result {
            case .success:
                self?.output.success()
            case .failure(let error):
                self?.output.failure(with: error.localizedDescription)
            }
        }
    }
}
