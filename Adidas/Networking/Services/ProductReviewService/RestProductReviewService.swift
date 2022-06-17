//
//  RestProductReviewService.swift
//  Adidas
//
//  Created by Vladislav Dudin on 16.06.2022.
//

import Foundation

struct RestProductReviewService: ProductReviewService, BaseRestService {
    var restClient: NetworkSessionProtocol

    func retrieveProductReviews(by productId: String, completion: @escaping (Result<[ProductReviewModel], Error>) -> Void) {
        guard
            let request = restClient.request(RequestRouter.Reviews.retrieveProductReviews(productId: productId))
        else {
            completion(.failure(URLError(.badURL)))
            return
        }

        request.responseData { [restClient] response in
            switch response.result {
            case .success(let data):
                guard
                    let reviews: [ProductReviewModel] = restClient.objectfromData(data)
                else {
                    completion(.failure(URLError(.badServerResponse)))
                    return
                }
                completion(.success(reviews))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func sendProductReview(review: ProductReviewModel, completion: @escaping (Result<Void, Error>) -> Void) {
        guard
            let request = restClient.request(RequestRouter.Reviews.sendProductReview(review: review))
        else {
            completion(.failure(URLError(.badURL)))
            return
        }

        request.responseData { response in
            switch response.result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
