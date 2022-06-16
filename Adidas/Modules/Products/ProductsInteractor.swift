//
//  ProductsInteractor.swift
//  Adidas
//
//  Created Vladislav Dudin on 16.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

private typealias Module = ProductsModule
private typealias Interactor = Module.Interactor

extension Module {
    final class Interactor {
        // MARK: - Dependencies

        weak var output: InteractorOutput!
        let productService: ProductService

        required init(productService: ProductService) {
            self.productService = productService
        }
    }
}

extension Interactor: Module.InteractorInput {
    func getProducts() {
        productService.retrieveProduct { [weak self] result in
            switch result {
            case .success(let response):
                self?.output.gotProducts(response)
            case .failure(let error):
                self?.output.failure(with: error.localizedDescription)
            }
        }
    }
}
