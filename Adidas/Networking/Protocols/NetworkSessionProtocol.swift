//
//  NetworkSessionProtocol.swift
//  Adidas
//
//  Created by Vladislav Dudin on 16.06.2022.
//

import Foundation
import Alamofire

protocol NetworkSessionProtocol: AnyObject {
    var sessionManager: Session { get }
    var decoder: JSONDecoder { get }
    var encoder: JSONEncoder { get }

    func request(_ type: NetworkRouterProtocol) -> DataRequest?
    func objectfromData<T: Decodable>(_ data: Data) -> T?
}

