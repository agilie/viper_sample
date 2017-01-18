//
//  AppRouterProtocol.swift
//  viper
//
//  Created by Sergii Avilov on 1/17/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

protocol AppRouterProtocol {
    
    var navigationController: UINavigationController { get }
    
    /// Push module into navigation stack
    ///
    /// - Parameters:
    ///   - urn: module urn
    ///   - animated:
    ///   - completion: module completion handler
    func pushModule(byUrn urn: String, animated: Bool, completion: ModuleCompletionHandler?)
    
    /// Set module as navigation stack root (and clear current)
    ///
    /// - Parameters:
    ///   - urn: module urn
    ///   - animated:
    ///   - completion: module completion handler
    func replaceViewStack(rootUrn urn: String, animated: Bool, completion: ModuleCompletionHandler?)
    
    /// Present module on navigation stack
    ///
    /// - Parameters:
    ///   - urn: module urn
    ///   - animated:
    ///   - completion: module completion handler
    func presentModule(byUrn urn: String, animated: Bool, completion: ModuleCompletionHandler?)
    
    /// Pop modules from navigation stack to view controller (module)
    ///
    /// - Parameters:
    ///   - controller:
    ///   - animated:
    func popToViewController(_ controller: UIViewController, animated: Bool)
    
    
    /// Pop top controller from navigation stack
    ///
    /// - Parameter animated:
    func popCurrentController(animated: Bool)
    
    /// Dismiss controller from navigation stack
    ///
    /// - Parameter animated:
    func dismissCurrentController(animated: Bool)
}
