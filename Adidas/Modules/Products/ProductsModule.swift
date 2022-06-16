//
//  ProductsModule.swift
//  Adidas
//
//  Created Vladislav Dudin on 16.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

struct ProductsModule {
    typealias ModuleAssemblying = ProductsAssemblyProtocol
    typealias ViewInput         = ProductsViewInputProtocol
    typealias ViewOutput        = ProductsViewOutputProtocol
    typealias InteractorInput   = ProductsInteractorInputProtocol
    typealias InteractorOutput  = ProductsInteractorOutputProtocol
    typealias RouterInput       = ProductsRouterInputProtocol

    enum Localize: String, Localizable {
        case productsNavigationTitle
        case productsSearchPlaceholder
    }
}

// MARK: - Assembly

protocol ProductsAssemblyProtocol {
    func assemble() -> UIViewController
}

// MARK: - View
protocol ProductsViewInputProtocol: BaseControllerInput {
    func reloadData()
}

protocol ProductsViewOutputProtocol: BaseControllerOutput {
    func getProducts() -> [ProductModel]
    func searchProduct(by text: String)
    func didSelectProduct(_ item: ProductModel)
}

// MARK: - Interactor

protocol ProductsInteractorInputProtocol {
    func getProducts()
}

protocol ProductsInteractorOutputProtocol: AnyObject {
    func gotProducts(_ items: [ProductModel])
    func failure(with error: String)
}

// MARK: - Router

protocol ProductsRouterInputProtocol {
    func showProductsDetailScreen(with item: ProductModel)
}
