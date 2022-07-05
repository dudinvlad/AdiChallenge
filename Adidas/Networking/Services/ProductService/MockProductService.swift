//
//  MockProductService.swift
//  Adidas
//
//  Created by Vladislav Dudin on 05.07.2022.
//

import Foundation

struct MockProductService: ProductService {
    func retrieveProducts(completion: @escaping (Result<[ProductModel], Error>) -> Void) {
        let product1 = ProductModel(id: "id1", name: "product name", description: "description 1", currency: "$", price: 14.55)
        let product2 = ProductModel(id: "id2", name: "product2", description: "description 2", currency: "$", price: 14.55)
        let product3 = ProductModel(id: "id3", name: "product3", description: "description 3", currency: "$", price: 14.55)
        let products: [ProductModel] = [product1, product2, product3]

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(.success(products))
        }
    }
}
