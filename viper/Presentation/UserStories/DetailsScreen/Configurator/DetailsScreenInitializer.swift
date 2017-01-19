//
//  DetailsScreenInitializer.swift
//  viper
//
//  Created by Sergii Avilov on 19/01/2017.
//  Copyright © 2017 Agilie. All rights reserved.
//

import UIKit

class DetailsScreenModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var detailsscreenViewController: DetailsScreenViewController!

    override func awakeFromNib() {

        let configurator = DetailsScreenModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: detailsscreenViewController)
    }

}
