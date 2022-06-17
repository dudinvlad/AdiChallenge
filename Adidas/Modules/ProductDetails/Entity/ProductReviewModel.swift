//
//  ProductReviewModel.swift
//  Adidas
//
//  Created by Vladislav Dudin on 16.06.2022.
//

import Foundation

struct ProductReviewModel: Codable {
    var productId: String?
    var locale: String?
    var rating: Int?
    var text: String?
}
