//
//  Style+Label.swift
//  Adidas
//
//  Created by Vladislav Dudin on 16.06.2022.
//

import Foundation

extension Style.Label {
    static let productInfoLabel = ColoredLabel(
        titleColor: .black,
        font: Style.Font.system14,
        numberOfLines: .zero
    )

    static let productReviewLabel = ColoredLabel(
        titleColor: .blue,
        font: Style.Font.systemBold14,
        numberOfLines: .zero
    )
}
