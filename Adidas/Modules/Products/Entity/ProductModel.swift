//
//  ProductModel.swift
//  Adidas
//
//  Created by Vladislav Dudin on 16.06.2022.
//

struct ProductModel: Codable {
    let id: String?
    let name: String?
    let description: String?
    let currency: String?
    let price: Float?
    let imgUrl: String?

    var priceDescription: String? {
        "\(String(format: "%.2f", price ?? 0.0))\(currency ?? "")"
    }
}
