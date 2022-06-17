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
    private lazy var productReviewService: ProductReviewService = RestProductReviewService(restClient: NetworkClient(baseURL: baseReviewURL))

    // MARK: - Modules -

    private lazy var productsAssembly: ProductsModule.ModuleAssembly = .init()
    private lazy var productDetailsAssembly: ProductDetailsModule.ModuleAssembly = .init()
    private lazy var addReviewAssembly: AddReviewModule.ModuleAssembly = .init()

    // MARK: - Public -

    func build() -> Container {
        let container = Container()

        // MARK: - Modules

        container.register { [productsAssembly] () -> ProductsModule.ModuleAssemblying in productsAssembly }
        container.register { [productDetailsAssembly] () -> ProductDetailsModule.ModuleAssemblying in productDetailsAssembly }
        container.register { [addReviewAssembly] () -> AddReviewModule.ModuleAssemblying in addReviewAssembly }

        // MARK: - Services
        container.register { [productService] () -> ProductService in productService }
        container.register { [productReviewService] () -> ProductReviewService in productReviewService }

        return container
    }
}
