//
//  StartScreenPresenter.swift
//  viper
//
//  Created by Wirex on 18/01/2017.
//  Copyright © 2017 Agilie. All rights reserved.
//

import Foundation
//import PromiseKit
//import CocoaLumberjack

class StartScreenPresenter {

    weak var view: StartScreenViewInput!
    var interactor: StartScreenInteractorInput!
    var moduleCompletion: ModuleCompletionHandler?
}

// MARK:
extension StartScreenPresenter: StartScreenViewOutput {
    
    func setupInitialState(withArguments args: NamedValuesType, completion: ModuleCompletionHandler?) {
        moduleCompletion = completion
    }

    func viewIsReady() {
            
    }
}


