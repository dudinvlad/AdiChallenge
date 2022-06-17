//
//  NetworkRouterProtocol.swift
//  Adidas
//
//  Created by Vladislav Dudin on 16.06.2022.
//

import Foundation
import Alamofire

enum RequestRouter { }

// MARK: - Networking Router Protocol

protocol NetworkRouterProtocol {
    typealias Endpoint = String

    var path: Endpoint { get }
    var method: HTTPMethod { get }
    var parameters: Encodable? { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders? { get }
}

extension NetworkRouterProtocol {
    var method: HTTPMethod { .get }
    var parameters: Encodable? { nil }
    var headers: HTTPHeaders? { nil }

    var encoding: ParameterEncoding {
        switch method {
            case .get:
                return URLEncoding.default
            case .post:
                return JSONEncoding.default
            default:
                return JSONEncoding.default
        }
    }
}

