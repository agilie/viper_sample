//
//  StartScreenConfigurator.swift
//  viper
//
//  Created by Sergii Avilov on 18/01/2017.
//  Copyright © 2017 Agilie. All rights reserved.
//

import UIKit

class StartScreenModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? StartScreenViewController {
            configure(viewController)
        }
    }

    private func configure(_ viewController: StartScreenViewController) {
        let presenter = StartScreenPresenter()
        presenter.view = viewController
        
        let interactor = StartScreenInteractor()
        interactor.weatherService = ServicesAssembly.shared.weatherService
        
        presenter.interactor = interactor
        presenter.router = PresentationAssembly.shared.router
        viewController.output = presenter
    }

}
