//
//  ProductService.swift
//  Adidas
//
//  Created by Vladislav Dudin on 16.06.2022.
//

import Alamofire

protocol ProductService {
    func retrieveProduct(completion: @escaping (Result<[ProductModel], Error>) -> Void)
}

extension RequestRouter {
    enum Products {
        case retrieveProducts
    }
}

extension RequestRouter.Products: NetworkRouterProtocol {
    var path: Endpoint {
        switch self {
            case .retrieveProducts:
                return "product"
        }
    }
}
