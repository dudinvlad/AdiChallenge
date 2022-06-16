//
//  ViewController.swift
//  Adidas
//
//  Created by Vladislav Dudin on 14.06.2022.
//

import UIKit
import SnapKit

class ViewController: BaseViewController {
    // MARK: - Variables

    private lazy var searchController: UISearchController = build(.init(searchResultsController: nil)) {
        $0.searchResultsUpdater = self
        $0.delegate = self
        $0.obscuresBackgroundDuringPresentation = false
        $0.searchBar.placeholder = "Search"
    }

    // MAKR: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetup()
    }

    // MARK: - Private

    private func initialSetup() {
        navigationItem.searchController = searchController
        title = "Adidas"
    }
}

// MARK: - UISearchResult Updating and UISearchControllerDelegate  Extension
  extension ViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        debugPrint(searchController.searchBar.text ?? "")
    }
 }
