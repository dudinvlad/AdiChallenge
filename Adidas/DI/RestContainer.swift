//
//  RestContainer.swift
//  Adidas
//
//  Created by Vladislav Dudin on 16.06.2022.
//

import Macaroni

class RestContainer {
    let baseURL: String
    let baseReviewURL: String

    // MARK: - Init

    init(baseURL: String, reviewURL: String) {
        self.baseReviewURL = reviewURL
        self.baseURL = baseURL
    }
}
