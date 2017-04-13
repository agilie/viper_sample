//
//  StartScreenPresenter.swift
//  viper
//
//  Created by Sergii Avilov on 18/01/2017.
//  Copyright © 2017 Agilie. All rights reserved.
//

import Foundation

class StartScreenPresenter {

    weak var view: StartScreenViewInput!
    var interactor: StartScreenInteractorInput!
    var moduleCompletion: ModuleCompletionHandler?
    var router: AppRouterProtocol!
    
}

// MARK:
extension StartScreenPresenter: StartScreenViewOutput {
    
    func setupInitialState(withArguments args: NamedValuesType, completion: ModuleCompletionHandler?) {
        moduleCompletion = completion
    }

    func viewIsReady() {
            
    }
    
    func showNextScreen(parameter: String) {
        let title = parameter.replacingOccurrences(of: " ", with: "_")
        let urn = DetailsScreenFactory.shared.createModuleURN(title: title)
        self.router.pushModule(byUrn: urn, animated: true) { (_) in
            
        }
    }
    
    var cities: [City] {
        return interactor.cities
    }
    
}


