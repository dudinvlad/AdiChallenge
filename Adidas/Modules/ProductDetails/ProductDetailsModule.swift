//
//  ProductDetailsModule.swift
//  Adidas
//
//  Created Vladislav Dudin on 16.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

struct ProductDetailsModule {
    typealias ModuleAssemblying = ProductDetailsAssemblyProtocol
    typealias ViewInput         = ProductDetailsViewInputProtocol
    typealias ViewOutput        = ProductDetailsViewOutputProtocol
    typealias InteractorInput   = ProductDetailsInteractorInputProtocol
    typealias InteractorOutput  = ProductDetailsInteractorOutputProtocol
    typealias RouterInput       = ProductDetailsRouterInputProtocol

    enum Localize: String, Localizable {
        case productAddReviewButtonTitle
    }
}

// MARK: - Assembly

protocol ProductDetailsAssemblyProtocol {
    func assemble() -> UIViewController
    var product: ProductModel? { get set }
}

// MARK: - Controller
protocol ProductDetailsViewInputProtocol: BaseControllerInput {
    func reloadData()
}

protocol ProductDetailsViewOutputProtocol: BaseControllerOutput {
    func getProductReviews() -> [ProductReviewModel]
    func showAddReviewScreen()
}

// MARK: - Interactor

protocol ProductDetailsInteractorInputProtocol {
    func retrieveProductReviews(_ productId: String)
}

protocol ProductDetailsInteractorOutputProtocol: AnyObject {
    func gotProductReviews(_ items: [ProductReviewModel])
    func failure(with error: String)
}

// MARK: - Router

protocol ProductDetailsRouterInputProtocol {
    func presentAddReviewScren(with item: ProductModel?)
}
