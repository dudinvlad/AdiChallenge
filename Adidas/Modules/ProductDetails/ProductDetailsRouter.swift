//
//  ProductDetailsRouter.swift
//  Adidas
//
//  Created Vladislav Dudin on 16.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

private typealias Module = ProductDetailsModule
private typealias Router = Module.Router

extension Module {
    final class Router {
        // MARK: - Dependencies

        weak var viewController: UIViewController!

        required init() { }
    }
}

extension Router: Module.RouterInput {
    func presentAddReviewScren(with item: ProductModel?) {
        
    }
}
