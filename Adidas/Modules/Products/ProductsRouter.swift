//
//  ProductsRouter.swift
//  Adidas
//
//  Created Vladislav Dudin on 16.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

private typealias Module = ProductsModule
private typealias Router = Module.Router

extension Module {
    final class Router {
        // MARK: - Dependencies

        weak var viewController: UIViewController!
        private var productDetailsAssembly: ProductDetailsModule.ModuleAssemblying

        required init(productDetails: ProductDetailsModule.ModuleAssemblying) {
            self.productDetailsAssembly = productDetails
        }
    }
}

extension Router: Module.RouterInput {
    func showProductsDetailScreen(with item: ProductModel) {
        productDetailsAssembly.product = item
        viewController.navigationController?.pushViewController(productDetailsAssembly.assemble(), animated: true)
    }
}
