//
//  ModuleFactoryProtocol.swift
//  viper
//
//  Created by Sergii Avilov on 1/17/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

typealias NamedValuesType = Dictionary<String, Any>
typealias ModuleCompletionHandler = ((_ : NamedValuesType?) -> Void)

protocol ModuleFactoryProtocol {
    
    /**
     * Module URN ( ex. profile:{userID} )
     */
    var moduleURN: String { get }
    
    /**
     * Create module with arguments
     * Returns module root UIViewController, must implement ModuleInputProtocol.
     */
    func createModule(arguments: NamedValuesType, completion: ModuleCompletionHandler?) -> UIViewController
}
