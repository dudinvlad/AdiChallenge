//
//  RestContainer.swift
//  Adidas
//
//  Created by Vladislav Dudin on 16.06.2022.
//

import Macaroni

class RestContainer {
    let baseURL: String
    let baseReviewURL: String

    // MARK: - Init

    init(baseURL: String, reviewURL: String) {
        self.baseReviewURL = reviewURL
        self.baseURL = baseURL
    }

    // MARK: - Services -

    private lazy var productService: ProductService = RestProductService(restClient: NetworkClient(baseURL: baseURL))

    // MARK: - Modules -

    private lazy var productsAssembly: ProductsModule.ModuleAssembly = .init()

    func build() -> Container {
        let container = Container()

        // MARK: - Modules

        container.register { [productsAssembly] () -> ProductsModule.ModuleAssemblying in productsAssembly }

        // MARK: - Services
        container.register { [productService] () -> ProductService in productService }

        return container
    }
}
