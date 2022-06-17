//
//  ProductReviewTableViewCell.swift
//  Adidas
//
//  Created by Vladislav Dudin on 16.06.2022.
//

import UIKit

class ProductReviewTableViewCell: UITableViewCell {
    // MARK: - Variables

    private lazy var containerStack: UIStackView = build {
        $0 <~ Style.Stack.defaultVerticalStack8
    }

    private lazy var ratingContainerStack: UIStackView = build {
        $0 <~ Style.Stack.defaultHorizontalStack8
        $0.distribution = .fill
        $0.alignment = .leading
    }

    private lazy var ratingLabel: UILabel = build {
        $0 <~ Style.Label.productReviewLabel
    }

    private lazy var descriptionLabel: UILabel = build {
        $0 <~ Style.Label.productReviewLabel
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        intialSetup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public

    func configurate(with item: ProductReviewModel) {
        ratingLabel.text = ProductDetailsModule.Localize.productReviewTitle.localized + String(item.rating ?? .zero) 
        descriptionLabel.text = item.text
    }

    // MARK: - Private
    private func intialSetup() {
        contentView.addSubview(containerStack)

        containerStack.addArrangedSubview(ratingContainerStack)
        ratingContainerStack.addArrangedSubview(ratingLabel)
        containerStack.addArrangedSubview(descriptionLabel)


        makeConstraints()
        selectionStyle = .none
    }

    private func makeConstraints() {
        containerStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
    }
}
