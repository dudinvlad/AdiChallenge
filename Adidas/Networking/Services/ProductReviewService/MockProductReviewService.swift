//
//  MockProductReviewService.swift
//  Adidas
//
//  Created by Vladislav Dudin on 05.07.2022.
//

import Foundation

struct MockProductReviewService: ProductReviewService {
    func retrieveProductReviews(by productId: String, completion: @escaping (Result<[ProductReviewModel], Error>) -> Void) {
        let review1 = ProductReviewModel(productId: "prod1", rating: 4, text: "review 1")
        let review2 = ProductReviewModel(productId: "prod1", rating: 3, text: "review 2")
        let review3 = ProductReviewModel(productId: "prod2", rating: 3, text: "review 3")
        let review4 = ProductReviewModel(productId: "prod2", rating: 3, text: "review 4")
        let reviews: [ProductReviewModel] = [review1, review2, review3, review4]

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(.success(reviews.filter {($0.productId ?? String()).elementsEqual(productId)}))
        }
    }

    func sendProductReview(review: ProductReviewModel, completion: @escaping (Result<Void, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(.success(()))
        }
    }


}
