//
//  ProductDetailsAssembly.swift
//  Adidas
//
//  Created Vladislav Dudin on 16.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Macaroni

private typealias Module = ProductDetailsModule
private typealias View = Module.ViewController

extension Module {
    final class ModuleAssembly: ModuleAssemblying {
        @Injected var productReviewService: ProductReviewService!
        @Injected var addReviewAssembly: AddReviewModule.ModuleAssemblying!
        var product: ProductModel?

        func assemble() -> UIViewController {
            let viewController: View   = .init(item: product)
            let presenter: Presenter   = .init(productItem: product)
            let interactor: Interactor = .init(productReviewService: productReviewService)
            let router: Router         = .init(addReview: addReviewAssembly)

            viewController.output = presenter

            presenter.view       = viewController
            presenter.router     = router
            presenter.interactor = interactor

            interactor.output = presenter

            router.viewController = viewController

            return viewController
        }
    }
}
