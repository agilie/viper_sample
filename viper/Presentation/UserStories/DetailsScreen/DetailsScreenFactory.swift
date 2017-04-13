//
//  DetailsScreenFactory.swift
//  viper
//
//  Created by Sergii Avilov on 19/01/2017.
//  Copyright © 2017 Agilie. All rights reserved.
//

import UIKit

struct DetailsScreenFactory : ModuleFactoryProtocol {

    private static let _shared = DetailsScreenFactory()

    static var shared: DetailsScreenFactory {
        return _shared
    }

    // MARK: ModuleFactoryProtocol
    var moduleURN: String {
        return "DetailsScreen:{cityId}"
    }

    func createModule(arguments: NamedValuesType, completion: ModuleCompletionHandler?) -> UIViewController {
        NSLog("Opening module '\(storyboardId)' with controller '\(initialControllerID)'")
        
        let storyboard = UIStoryboard(name: storyboardId, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: initialControllerID)
        
        let moduleInput = controller as? ModuleInputProtocol
        if let moduleInput = moduleInput {
            moduleInput.setupInitialState(withArguments: arguments, completion: completion)
        } else {
            fatalError("\(initialControllerID) moduleInput == nil")
        }
        
        return controller
    }

    // MARK: Helpers
    func createModuleURN(title: String) -> String {
        return URNBuilder(string: moduleURN).buildWithArgs(args: [title])
    }
    
    // MARK:
    let storyboardId = "DetailsScreen"
    let initialControllerID = "DetailsScreenViewController"
}
