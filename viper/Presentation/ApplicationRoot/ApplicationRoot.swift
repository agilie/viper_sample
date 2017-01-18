//
//  File.swift
//  viper
//
//  Created by Sergii Avilov on 1/17/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ApplicationRoot: NSObject {
    
    // TODO: Add all application modules here
    let modules : Array<ModuleFactoryProtocol> = [
        StartScreenFactory.shared
    ]

    // MARK:
    fileprivate let router: AppRouterProtocol
    fileprivate let whisper: InAppNotificationsProvider

    init(withNavigation navigation: UINavigationController) {
        let services =  ServicesAssembly.shared
        let presentation = PresentationAssembly.shared
                        
        presentation.setup(withNavigation: navigation, modules: modules, urlScheme: "wirex", services: services)
        
        router = presentation.router
        whisper = presentation.whisper
        
        super.init()
    }

    func start() {
        let urn = StartScreenFactory.shared.moduleURN
        router.pushModule(byUrn: urn, animated: true, completion: { [unowned self] (_) in
            //completion
        })
    }

}