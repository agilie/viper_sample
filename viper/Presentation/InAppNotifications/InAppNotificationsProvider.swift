//
//  InAppNotificationsProvider.swift
//  viper
//
//  Created by Sergii Avilov on 1/17/17.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation

protocol InAppNotificationsProvider {
    
    func showError(err: Error)
    
    func showInfoMessage(msg: String)
    func showWarningMessage(msg: String)
    func showErrorMessage(msg: String)
    
}
