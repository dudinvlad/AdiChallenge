//
//  RestProductService.swift
//  Adidas
//
//  Created by Vladislav Dudin on 16.06.2022.
//

import Foundation

struct RestProductService: ProductService, BaseRestService {
    var restClient: NetworkSessionProtocol

    func retrieveProducts(completion: @escaping (Result<[ProductModel], Error>) -> Void) {
        guard let request = restClient.request(RequestRouter.Products.retrieveProducts) else {
            completion(.failure(URLError(.badURL)))
            return
        }

        request.responseData { [restClient] response in
            switch response.result {
            case .success(let data):
                guard let products: [ProductModel] = restClient.objectfromData(data) else {
                    completion(.failure(URLError(.badServerResponse)))
                    return
                }

                completion(.success(products))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
