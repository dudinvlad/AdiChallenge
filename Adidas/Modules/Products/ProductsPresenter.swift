//
//  ProductsPresenter.swift
//  Adidas
//
//  Created Vladislav Dudin on 16.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

private typealias Module = ProductsModule
private typealias Presenter = Module.Presenter

extension Module {
    final class Presenter {
        // MARK: - Dependencies

        weak var view: ViewInput!
        var interactor: InteractorInput!
        var router: RouterInput!

        required init() { }

        // MARK: - Variables

        private var searchedDataSource: [ProductModel] = .init()
        private var originalDataSource: [ProductModel] = .init()
    }
}

private extension Presenter { }

extension Presenter: Module.ViewOutput {
    func didSelectProduct(_ item: ProductModel) {
        router.showProductsDetailScreen(with: item)
    }

    func getProducts() -> [ProductModel] {
        searchedDataSource
    }

    func searchProduct(by text: String) {
        guard !text.isEmpty else {
            searchedDataSource = originalDataSource
            view.reloadData()
            return
        }

        searchedDataSource = originalDataSource.filter {
            ($0.name ?? "").lowercased().contains(text.lowercased()) ||
            ($0.description ?? "").lowercased().contains(text.lowercased())
        }
        view.reloadData()
    }
}

extension Presenter: Module.InteractorOutput {
    func didLoad() {
        view.showActivity()
        interactor.getProducts()
    }

    func gotProducts(_ items: [ProductModel]) {
        view.hideActivity()
        originalDataSource = items
        searchedDataSource = items
        view.reloadData()
    }

    func failure(with error: String) {
        view.hideActivity()
        view.showNetworking(error: error)
    }
}
