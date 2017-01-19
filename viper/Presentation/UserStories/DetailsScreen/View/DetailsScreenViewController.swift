//
//  DetailsScreenViewController.swift
//  viper
//
//  Created by Sergii Avilov on 19/01/2017.
//  Copyright © 2017 Agilie. All rights reserved.
//

import UIKit

class DetailsScreenViewController: UIViewController {

   	// MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details Screen"
        titleLabel.text = titleParameter
        output.viewIsReady()
    }
    
    // MARK: Handlers

    // MARK:
    var output: DetailsScreenViewOutput!
    var titleParameter: String?
    
    // MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    
}

// MARK:
extension DetailsScreenViewController: ModuleInputProtocol {

    func setupInitialState(withArguments args: NamedValuesType, completion: ModuleCompletionHandler?) {
        titleParameter = args["title"] as? String
        output.setupInitialState(withArguments: args, completion: completion)
    }
}

// MARK:
extension DetailsScreenViewController: DetailsScreenViewInput {

}
