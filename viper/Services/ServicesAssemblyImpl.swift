//
//  ServicesAssemblyImpl.swift
//  viper
//
//  Created by Sergii Avilov on 1/17/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ServicesAssemblyImpl: ServicesAssemblyProtocol {
    
    init(application: UIApplication) {
        self.application = application
    }
    
    let application: UIApplication
    //All Available Services should be here like
    //let userService: UserServiceProtocol
    
}
