//
//  ModuleInputProtocol.swift
//  viper
//
//  Created by Sergii Avilov on 1/18/17.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation

protocol ModuleInputProtocol {
    
    /**
     * Configure module with arguments.
     * Calls form Module factory
     */
    func setupInitialState(withArguments args: NamedValuesType, completion: ModuleCompletionHandler?)
}
