//
//  AdidasTests.swift
//  AdidasTests
//
//  Created by Vladislav Dudin on 14.06.2022.
//

import XCTest
@testable import Adidas

class AdidasTests: XCTestCase {

    var productItem: ProductModel!
    var productItemNoPrice: ProductModel!
    var networkSession: NetworkSessionProtocol!
    var reviewService: ProductReviewService!
    var productService: ProductService!

    override func setUpWithError() throws {
        print("AdidasTest instance ===> \(ObjectIdentifier(self))")
        // Put setup code here. This method is called before the invocation of each test method in the class.
        productItem = ProductModel(id: "id", name: "name", description: "description", currency: "$", price: 14.43111111, imgUrl: String())
        productItemNoPrice = ProductModel(currency: "$", price: .zero)
        networkSession = NetworkSession(baseURL: "real world url")
        reviewService = MockProductReviewService()
        productService = MockProductService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        productItem = nil
        productItemNoPrice = nil
        productService = nil
        reviewService = nil
    }

    func testPriceDescription() {
        XCTAssertEqual(productItem.priceDescription, "14.43$")
        XCTAssertEqual(productItemNoPrice.priceDescription, "0.0")
    }

    func testAsDictionary() throws {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase

        let productItemDictionary = productItem.asDictionary(encoder: encoder)
        XCTAssertNotNil(productItemDictionary)
        let price = productItemDictionary?["price"] as? Float
        XCTAssertEqual(productItem.price, price)
    }

    func testObjectfromData() {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase

        let encodedProduct = try? encoder.encode(productItem)
        XCTAssertNotNil(encodedProduct)

        let item: ProductModel? = networkSession.objectfromData(encodedProduct!)
        XCTAssertNotNil(item)
    }

    func test_get_reviews() {
        let expectation = expectation(description: "Reviews")
        var reviews: [ProductReviewModel] = .init()

        reviewService.retrieveProductReviews(by: "prod1") { result in
            switch result {
            case .success(let incomingRevies):
                reviews = incomingRevies
            case .failure(_): break
            }

            expectation.fulfill()
        }

        waitForExpectations(timeout: 2)
        XCTAssertFalse(reviews.isEmpty)
    }

    func test_get_products() {
        let expectation = expectation(description: "Products")
        var products: [ProductModel] = .init()

        productService.retrieveProducts { result in
            switch result {
            case .success(let incomingProducts):
                products = incomingProducts
            case .failure(_): break
            }

            expectation.fulfill()
        }

        waitForExpectations(timeout: 2)
        XCTAssertFalse(products.isEmpty)
    }
}
