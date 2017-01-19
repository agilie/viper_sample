//
//  DetailsScreenPresenter.swift
//  viper
//
//  Created by Sergii Avilov on 19/01/2017.
//  Copyright © 2017 Agilie. All rights reserved.
//

import Foundation

class DetailsScreenPresenter {

    weak var view: DetailsScreenViewInput!
    var interactor: DetailsScreenInteractorInput!
    var moduleCompletion: ModuleCompletionHandler?
}

// MARK:
extension DetailsScreenPresenter: DetailsScreenViewOutput {
    
    func setupInitialState(withArguments args: NamedValuesType, completion: ModuleCompletionHandler?) {
        moduleCompletion = completion
    }

    func viewIsReady() {
            
    }
}


