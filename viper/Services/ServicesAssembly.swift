//
//  ServicesAssembly.swift
//  viper
//
//  Created by Sergii Avilov on 1/17/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

struct ServicesAssembly {
    
    static var shared: ServicesAssemblyProtocol {
        return _services
    }
    
    // MARK:
    static func setup(application: UIApplication) {
        _services = ServicesAssemblyImpl(application: application)
    }
    
    // MARK:
    static fileprivate var _services: ServicesAssemblyProtocol!
}
