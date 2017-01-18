//
//  AppRouterProtocolImpl.swift
//  viper
//
//  Created by Sergii Avilov on 1/17/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class AppRouterImpl: AppRouterProtocol {

    // MARK:
    private let modulesList: Array<ModuleFactoryProtocol>
    private let _navigationController: UINavigationController

    init(withNavigation controller: UINavigationController, modules: Array<ModuleFactoryProtocol>, urlScheme: String) {
        
        _navigationController = controller
        _navigationController.setNavigationBarHidden(true, animated: false)
        modulesList = modules
    }
    
    // MARK:
    
    var navigationController: UINavigationController {
        return _navigationController
    }
    
    func pushModule(byUrn urn: String, animated: Bool, completion: ModuleCompletionHandler?) {
//        guard let url = URL(string:"\(Compass.scheme)\(urn)") else {
        guard let url = URL(string:urn) else {
            fatalError("Invalid URN: \(urn)")
        }
        
        guard let controller = createModule(byUrl: url, completion: completion) else {
            fatalError("Can't create controller by URL: \(url)")
        }
        
        navigationController.pushViewController(controller, animated: animated)
    }
    
    func replaceViewStack(rootUrn urn: String, animated: Bool, completion: ModuleCompletionHandler?) {
//        guard let url = URL(string:"\(Compass.scheme)\(urn)") else {
        guard let url = URL(string:urn) else {
            fatalError("Invalid URN: \(urn)")
        }
        
        guard let controller = createModule(byUrl: url, completion: completion) else {
            fatalError("Can't create controller by URL: \(url)")
        }
        
        navigationController.setViewControllers([controller], animated: animated)
    }
    
    func presentModule(byUrn urn: String, animated: Bool, completion: ModuleCompletionHandler?) {
//        guard let url = URL(string:"\(Compass.scheme)\(urn)") else {
        guard let url = URL(string:urn) else {
            fatalError("Invalid URN: \(urn)")
        }
        
        guard let controller = createModule(byUrl: url, completion: completion) else {
            fatalError("Can't create controller by URL: \(url)")
        }
        
        navigationController.present(controller, animated: animated, completion: nil)
    }
    
    //
    
    func popToRootController(animated: Bool) {
        navigationController.popToRootViewController(animated: animated)
    }
    
    func popCurrentController(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
    
    func popToViewController(_ controller: UIViewController, animated: Bool) {
        navigationController.popToViewController(controller, animated: animated)
    }
    
    func dismissCurrentController(animated: Bool) {
        navigationController.dismiss(animated: animated, completion: nil)
    }
    
    // MARK:
    
    private func createModule(byUrl url: URL, completion: ModuleCompletionHandler?) -> UIViewController? {
        
//        guard let location = url else {
//            return nil
//        }
        
//        let arguments = location.arguments
        
//        DDLogInfo("Create module with path: '\(location.path)',  arguments: '\(arguments)'")
        
        let factory = modulesList.first {
            return url.absoluteString == $0.moduleURN
        }
        
        return factory?.createModule(arguments: [:], completion: completion)
    }
    
}
