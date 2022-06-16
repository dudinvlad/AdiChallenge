//
//  ProductTableViewCell.swift
//  Adidas
//
//  Created by Vladislav Dudin on 16.06.2022.
//

import UIKit
import Kingfisher

class ProductTableViewCell: UITableViewCell {
    // MARK: - Variables

    private lazy var containerStack: UIStackView = build {
        $0.axis = .horizontal
        $0.spacing = 20
    }

    private lazy var productImageView: UIImageView = build {
        $0.contentMode = .scaleAspectFit
    }

    private lazy var productInfoStack: UIStackView = build {
        $0.axis = .vertical
        $0.spacing = 5
        $0.alignment = .fill
        $0.distribution = .equalSpacing
    }

    private lazy var productNameLabel: UILabel = build {
        $0 <~ Style.Label.productInfoLabel
    }

    private lazy var productDescriptionLabel: UILabel = build {
        $0 <~ Style.Label.productInfoLabel
    }

    private lazy var productPriceLabel: UILabel = build {
        $0 <~ Style.Label.productInfoLabel
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

    private func intialSetup() {
        accessoryType = .disclosureIndicator
        contentView.addSubview(containerStack)

        containerStack.addArrangedSubview(productImageView)
        containerStack.addArrangedSubview(productInfoStack)
        productInfoStack.addArrangedSubview(productNameLabel)
        productInfoStack.addArrangedSubview(productDescriptionLabel)
        productInfoStack.addArrangedSubview(productPriceLabel)

        makeConstraints()
        selectionStyle = .none
    }

    private func makeConstraints() {
        containerStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }

        productImageView.snp.makeConstraints { make in
            make.size.equalTo(70)
        }
    }

    // MARK: - Public

    func configurate(with item: ProductModel) {
        productImageView.kf.indicatorType = .activity
        productImageView.kf.setImage(
            with: URL(string: item.imgUrl ?? ""),
            placeholder: UIImage(),
            options:
                [.scaleFactor(UIScreen.main.scale),
                 .transition(.fade(1))
                ]
        )
        productNameLabel.text = item.name
        productDescriptionLabel.text = item.description
        productPriceLabel.text = item.priceDescription
    }
}
