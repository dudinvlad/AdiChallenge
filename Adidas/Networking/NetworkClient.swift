//
//  NetworkClient.swift
//  Adidas
//
//  Created by Vladislav Dudin on 16.06.2022.
//

import Alamofire

enum ApiUrls: String {
    case baseUrl = "http://localhost:3001/"
    case baseReviewUrl = "http://localhost:3002/"
}

final class NetworkClient: NetworkSession {
    class func isConnectedToInternet() -> Bool {
        NetworkReachabilityManager()?.isReachable ?? false
    }
}

protocol BaseRestService {
    var restClient: NetworkSessionProtocol { get }
}
