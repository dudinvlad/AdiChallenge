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

    init(id: String? = nil, name: String? = nil, description: String? = nil, currency: String? = nil, price: Float? = nil, imgUrl: String? = nil) {
        self.id = id
        self.name = name
        self.description = description
        self.currency = currency
        self.price = price
        self.imgUrl = imgUrl
    }

    var priceDescription: String? {
        guard
            let productPrice = price,
            productPrice != .zero
        else { return "0.0"}

        return "\(String(format: "%.2f", productPrice))\(currency ?? "")"
    }
}
