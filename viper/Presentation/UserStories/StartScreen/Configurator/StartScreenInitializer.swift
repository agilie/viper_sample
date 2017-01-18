//
//  StartScreenInitializer.swift
//  viper
//
//  Created by Sergii Avilov on 18/01/2017.
//  Copyright © 2017 Agilie. All rights reserved.
//

import UIKit

class StartScreenModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var startscreenViewController: StartScreenViewController!

    override func awakeFromNib() {

        let configurator = StartScreenModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: startscreenViewController)
    }

}
