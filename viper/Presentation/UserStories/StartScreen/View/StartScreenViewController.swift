//
//  StartScreenViewController.swift
//  viper
//
//  Created by Sergii Avilov on 18/01/2017.
//  Copyright © 2017 Agilie. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {

   	// MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: Handlers

    // MARK:
    var output: StartScreenViewOutput!

    // MARK: Outlets
    
}

// MARK:
extension StartScreenViewController: ModuleInputProtocol {

    func setupInitialState(withArguments args: NamedValuesType, completion: ModuleCompletionHandler?) {
        output.setupInitialState(withArguments: args, completion: completion)
    }
}

// MARK:
extension StartScreenViewController: StartScreenViewInput {

}
