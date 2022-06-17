//
//  AddReviewAssembly.swift
//  Adidas
//
//  Created Vladislav Dudin on 17.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Macaroni

private typealias Module = AddReviewModule
private typealias View = Module.ViewController

extension Module {
    final class ModuleAssembly: ModuleAssemblying {
        var product: ProductModel?
        @Injected var reviewService: ProductReviewService!
        
        func assemble() -> UIViewController {
            let viewController: View   = .init(item: product)
            let presenter: Presenter   = .init(product: product)
            let interactor: Interactor = .init(productReviewService: reviewService)
            let router: Router         = .init()

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
