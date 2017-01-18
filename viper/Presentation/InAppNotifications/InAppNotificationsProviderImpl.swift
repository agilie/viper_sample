//
//  InAppNotificationsProviderImpl.swift
//  viper
//
//  Created by Sergii Avilov on 1/17/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class InAppNotificationsProviderImpl {
    
    let msgTimeout = 3.0
    let errTimeout = 5.0
    
    init(withNavigation controller: UINavigationController) {
        navigation = controller
    }
    
    let navigation: UINavigationController
}

extension InAppNotificationsProviderImpl: InAppNotificationsProvider {
    
    func showError(err: Error) {
        showErrorMessage(msg: errorText(err: err))
    }
    
    //
    
    func showErrorMessage(msg: String) {
        showMessage(title: "Error", msg: msg)
    }
    
    func showWarningMessage(msg: String) {
        showMessage(title: "Warning", msg: msg)
    }
    
    func showInfoMessage(msg: String) {
        showMessage(title: "Info", msg: msg)
    }
    
}

extension InAppNotificationsProviderImpl {
    
    func showMessage(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        navigation.present(alert, animated: true, completion: nil)
    }
    
    func errorText(err: Error) -> String {
        return err.localizedDescription
    }
    
}
