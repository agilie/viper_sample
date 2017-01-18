//
//  PresentationAssembly.swift
//  viper
//
//  Created by Sergii Avilov on 1/17/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class PresentationAssembly: PresentationAssemblyProtocol {
    
    static let shared = PresentationAssembly()
    
    var router: AppRouterProtocol!
    var whisper: InAppNotificationsProvider!
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func setup(withNavigation navigation: UINavigationController, modules: Array<ModuleFactoryProtocol>, urlScheme: String, services: ServicesAssemblyProtocol) {
        router = AppRouterImpl(withNavigation: navigation, modules: modules, urlScheme: urlScheme)
        whisper = InAppNotificationsProviderImpl(withNavigation: navigation)
    }
}
