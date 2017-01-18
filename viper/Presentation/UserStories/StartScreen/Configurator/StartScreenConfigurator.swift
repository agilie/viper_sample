//
//  StartScreenConfigurator.swift
//  viper
//
//  Created by Wirex on 18/01/2017.
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
        
        presenter.interactor = interactor
        viewController.output = presenter
    }

}
