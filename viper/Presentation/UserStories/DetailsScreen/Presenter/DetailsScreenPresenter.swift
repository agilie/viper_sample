//
//  DetailsScreenPresenter.swift
//  viper
//
//  Created by Sergii Avilov on 19/01/2017.
//  Copyright © 2017 Agilie. All rights reserved.
//

import Foundation
import PromiseKit

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
    
    func city(with id: Int) -> City? {
        return interactor.city(with: id)
    }
    
    func requestWeather(for cityId: Int) {
        //show progress indicator if needed
        interactor.obtainCurrentWeather(for: cityId)
        .then { (weather) -> Void in
            if self.view != nil {
                self.view.assignWeather(weather)
            }
        }
        .catch { (error) in
            if let viewController = self.view as? UIViewController {
                self.showError(error, for: viewController)
            }
        }
        .always {
            //hide progress indicator if shown
        }
    }

}

extension DetailsScreenPresenter {
    
    func showError(_ error: Error, for controller: UIViewController) {
        var errorMessage = error.localizedDescription
        if let apiError = error as? APIError {
            errorMessage = apiError.message
        }
        let alert = UIAlertController.init(title: "Error", message: errorMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        controller.present(alert, animated: true, completion: nil)
    }
    
}

