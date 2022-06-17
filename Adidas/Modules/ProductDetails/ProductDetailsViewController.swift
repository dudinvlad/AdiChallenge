//
//  ProductDetailsViewController.swift
//  Adidas
//
//  Created Vladislav Dudin on 16.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

private typealias Module = ProductDetailsModule
private typealias Controller = Module.ViewController

extension Module {
    final class ViewController: BaseViewController {
        // MARK: - Dependencies

        var output: ViewOutput!
        var product: ProductModel?

        // MARK: - Variables

        private lazy var scrollView: UIScrollView = .init()
        private lazy var contentView: UIView = .init()

        private lazy var containerStack: UIStackView = build {
            $0 <~ Style.Stack.defaultVerticalStack0
        }

        private lazy var productImageView: UIImageView = build {
            $0.contentMode = .scaleAspectFill
            $0.kf.setImage(with: URL(string: product?.imgUrl ?? ""))
            $0.cornerRadius(10)
        }

        private lazy var productInfoContainerStack: UIStackView = build {
            $0 <~ Style.Stack.defaultHorizontalStack0
        }

        private lazy var productNameLabel: UILabel = build {
            $0 <~ Style.Label.productInfoLabel
            $0.text = product?.name
        }

        private lazy var productPriceLabel: UILabel = build {
            $0 <~ Style.Label.productInfoLabel
            $0.text = product?.priceDescription
        }

        private lazy var productDescriptionLabel: UILabel = build {
            $0 <~ Style.Label.productInfoLabel
            $0.text = product?.description
        }

        private lazy var tableView: UITableView = build {
            $0.dataSource = self
            $0.separatorStyle = .none
            $0.register(ProductReviewTableViewCell.self)
        }

        private lazy var addReviewButton: UIButton = build {
            $0.setTitle(Localize.productAddReviewButtonTitle.localized, for: .normal)
            $0.configuration = .borderedTinted()
            $0.addAction(addReviewAction, for: .touchUpInside)
        }

        private lazy var addReviewAction: UIAction = .init { _ in
            self.output.showAddReviewScreen()
        }

        // MARK: - Lifecycle

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        init(item: ProductModel?) {
            self.product = item
            super.init(nibName: nil, bundle: nil)
        }

        override func viewDidLoad() {
            super.viewDidLoad()

            output?.didLoad()
            initialSetup()
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

            output?.willAppear()
        }
    }
}

private extension Controller {
    private func initialSetup() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(containerStack)
        containerStack.addArrangedSubview(productImageView)
        containerStack.addArrangedSubview(productInfoContainerStack)
        productInfoContainerStack.addArrangedSubview(productNameLabel)
        productInfoContainerStack.addArrangedSubview(UIView())
        productInfoContainerStack.addArrangedSubview(productPriceLabel)
        containerStack.setCustomSpacing(15, after: productImageView)
        containerStack.setCustomSpacing(15, after: productInfoContainerStack)
        containerStack.addArrangedSubview(productDescriptionLabel)
        containerStack.addArrangedSubview(tableView)
        containerStack.addArrangedSubview(UIView())
        containerStack.addArrangedSubview(addReviewButton)
        containerStack.setCustomSpacing(20, after: tableView)

        makeConstraints()
        title = ProductDetailsModule.Localize.productDetailsNavigationTitle.localized
    }

    private func makeConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.edges.width.equalToSuperview()
        }
        containerStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        productImageView.snp.makeConstraints { make in
            make.height.equalTo(250)
        }
        tableView.snp.makeConstraints { make in
            make.height.equalTo(200)
        }
    }
}

extension Controller: Module.ViewInput {
    func reloadData() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource -
extension Controller: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        output.getProductReviews().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductReviewTableViewCell.reusebleId, for: indexPath) as? ProductReviewTableViewCell,
            let review = output?.getProductReviews()[indexPath.row]
        else { return .init() }

        cell.configurate(with: review)

        return cell
    }
}
