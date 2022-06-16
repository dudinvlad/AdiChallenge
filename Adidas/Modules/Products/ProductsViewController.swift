//
//  ProductsViewController.swift
//  Adidas
//
//  Created Vladislav Dudin on 16.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

private typealias Module = ProductsModule
private typealias Controller = Module.ViewController

extension Module {
    final class ViewController: BaseViewController {
        // MARK: - Dependencies

        var output: ViewOutput!

        private lazy var tableView: UITableView = build {
            $0.delegate = self
            $0.dataSource = self
            $0.separatorStyle = .none
            $0.keyboardDismissMode = .onDrag
            $0.register(ProductTableViewCell.self)
        }

        private lazy var searchController: UISearchController = build(.init(searchResultsController: nil)) {
            $0.searchResultsUpdater = self
            $0.obscuresBackgroundDuringPresentation = false
            $0.searchBar.placeholder = Localize.productsSearchPlaceholder.localized
        }

        // MARK: - Lifecycle

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        init() {
            super.init(nibName: nil, bundle: nil)

        }

        override func viewDidLoad() {
            super.viewDidLoad()

            output?.didLoad()
            initialSetup()
        }

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)

            output?.didAppear()
        }

        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)

            output?.didDisappear()
        }
    }
}

private extension Controller {
    private func initialSetup() {
        navigationBarSetup()
        initialUISetup()
    }

    private func initialUISetup() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func navigationBarSetup() {
        navigationItem.searchController = searchController
        title = ProductsModule.Localize.productsNavigationTitle.localized
    }
}

extension Controller: Module.ViewInput {
    func reloadData() {
        tableView.reloadData()
    }
}

extension Controller: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        86
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        output?.getProducts().count ?? .zero
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.reusebleId, for: indexPath) as? ProductTableViewCell,
            let product = output?.getProducts()[indexPath.row]
        else { return .init() }

        cell.configurate(with: product)

        return cell
    }
}

extension Controller: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.output.getProducts()[indexPath.row]
        self.output.didSelectProduct(item)
    }
}

extension Controller: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }

        output?.searchProduct(by: searchText)
    }
}

