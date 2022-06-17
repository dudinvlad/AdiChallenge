//
//  ProductReviewService.swift
//  Adidas
//
//  Created by Vladislav Dudin on 16.06.2022.
//

import Alamofire

protocol ProductReviewService {
    func retrieveProductReviews(by productId: String, completion: @escaping (Result<[ProductReviewModel], Error>) -> Void)
    func sendProductReview(review: ProductReviewModel, completion: @escaping (Result<Void, Error>) -> Void)
}

extension RequestRouter {
    enum Reviews {
        case retrieveProductReviews(productId: String)
        case sendProductReview(review: ProductReviewModel)
    }
}

extension RequestRouter.Reviews: NetworkRouterProtocol {
    var path: Endpoint {
        switch self {
            case .retrieveProductReviews(let data):
                return "reviews/\(data)"
            case .sendProductReview(let data):
                return "reviews/\(data.productId ?? "")"
        }
    }

    var method: HTTPMethod {
        switch self {
            case .retrieveProductReviews:
                return .get
            case .sendProductReview:
                return .post
        }
    }

    var parameters: Encodable? {
        switch self {
            case .retrieveProductReviews:
                return nil
            case .sendProductReview(let data):
                return data
        }
    }
}
