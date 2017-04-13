//
//  DetailsScreenConfigurator.swift
//  viper
//
//  Created by Sergii Avilov on 19/01/2017.
//  Copyright © 2017 Agilie. All rights reserved.
//

import UIKit

class DetailsScreenModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? DetailsScreenViewController {
            configure(viewController)
        }
    }

    private func configure(_ viewController: DetailsScreenViewController) {
        let presenter = DetailsScreenPresenter()
        presenter.view = viewController
        
        let interactor = DetailsScreenInteractor()
        interactor.weatherService = ServicesAssembly.shared.weatherService
        
        presenter.interactor = interactor
        viewController.output = presenter
    }

}
