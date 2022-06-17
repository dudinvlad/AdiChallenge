//
//  ProductDetailsInteractor.swift
//  Adidas
//
//  Created Vladislav Dudin on 16.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

private typealias Module = ProductDetailsModule
private typealias Interactor = Module.Interactor

extension Module {
    final class Interactor {
        // MARK: - Dependencies

        weak var output: InteractorOutput!
        let productReviewService: ProductReviewService

        required init(productReviewService: ProductReviewService) {
            self.productReviewService = productReviewService
        }

    }
}

extension Interactor: Module.InteractorInput {
    func retrieveProductReviews(_ productId: String) {
        productReviewService.retrieveProductReviews(by: productId) { [weak self] result in
            switch result {
            case .success(let reviews):
                self?.output.gotProductReviews(reviews)
            case .failure(let error):
                self?.output.failure(with: error.localizedDescription)
            }
        }
    }
}
