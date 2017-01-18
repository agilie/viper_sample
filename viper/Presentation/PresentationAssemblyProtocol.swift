//
//  PresentationAssemblyProtocol.swift
//  viper
//
//  Created by Sergii Avilov on 1/17/17.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation

protocol PresentationAssemblyProtocol {
    
    var router: AppRouterProtocol! { get }
    var whisper: InAppNotificationsProvider! { get }

}
