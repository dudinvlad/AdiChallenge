//
//  AddReviewModule.swift
//  Adidas
//
//  Created Vladislav Dudin on 17.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

struct AddReviewModule {
    typealias ModuleAssemblying = AddReviewAssemblyProtocol
    typealias ViewInput         = AddReviewViewInputProtocol
    typealias ViewOutput        = AddReviewViewOutputProtocol
    typealias InteractorInput   = AddReviewInteractorInputProtocol
    typealias InteractorOutput  = AddReviewInteractorOutputProtocol
    typealias RouterInput       = AddReviewRouterInputProtocol

    enum Localize: String, Localizable {
        case addReviewTextFieldPlaceholder
        case addReviewPlaceholder
        case addReviewSendButtonTitle
        case addReviewNavigationTitle
    }
}

// MARK: - Assembly

protocol AddReviewAssemblyProtocol {
    func assemble() -> UIViewController
    var product: ProductModel? { get set }
}

// MARK: - View
protocol AddReviewViewInputProtocol: BaseControllerInput { }

protocol AddReviewViewOutputProtocol: BaseControllerOutput {
    func sendReview(with text: String?, rating: String?)
}

// MARK: - Interactor

protocol AddReviewInteractorInputProtocol {
    func sendReview(with text: String, rating: Int, productId: String?)
}

protocol AddReviewInteractorOutputProtocol: AnyObject {
    func failure(with error: String)
    func success()
}

// MARK: - Router

protocol AddReviewRouterInputProtocol {
    func close()
}
