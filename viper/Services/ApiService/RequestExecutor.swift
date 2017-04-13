//
//  RequestExecutor.swift
//  viper
//
//  Created by Sergii Avilov on 4/11/17.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class RequestExecutor {
    
    // MARK:
    fileprivate let builder: RequestBuilder
    fileprivate let congiguration: URLSessionConfiguration = URLSessionConfiguration.default
    fileprivate let queue: DispatchQueue
    fileprivate let session: SessionManager

    //MARK:
    init(requestBuilder: RequestBuilder) {
        queue = DispatchQueue.global(qos: .utility)
        builder = requestBuilder
        session = SessionManager(configuration: congiguration)
    }

    // MARK:
    fileprivate func processResponse(response: DataResponse<Any>, checkToken: Bool, completion: @escaping (Any?, APIError?) -> Void) {
        NSLog("response: %@", response.debugDescription)
        let statusCode = response.response?.statusCode ?? 500
        if statusCode == 200 {
            completion(response.result.value, nil)
        } else {
            completion(nil, APIError(message: "Server error"))
        }
    }
    
    //MARK:
    func runRequest(request: URLRequest, completion: @escaping (Any?, APIError?) -> Void) {
        NSLog("request: %@", request.debugDescription)
        session.request(request)
            .validate(statusCode: [200])
            .responseJSON(queue: queue) { (response) in
                self.processResponse(response: response, checkToken: true, completion: completion)
        }
    }

}
