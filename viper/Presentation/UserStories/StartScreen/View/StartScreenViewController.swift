//
//  StartScreenViewController.swift
//  viper
//
//  Created by Sergii Avilov on 18/01/2017.
//  Copyright © 2017 Agilie. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {

   	// MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    // MARK: Handlers
    @IBAction func showDetailsFirst(_ sender: UIButton) {
        showDetailsFirst()
    }
    
    @IBAction func showDetailsSecond(_ sender: UIButton) {
        showDetailsSecond()
    }

    // MARK:
    var output: StartScreenViewOutput!

    // MARK: Outlets
    
}

// MARK:
extension StartScreenViewController: ModuleInputProtocol {

    func setupInitialState(withArguments args: NamedValuesType, completion: ModuleCompletionHandler?) {
        output.setupInitialState(withArguments: args, completion: completion)
    }
}

// MARK:
extension StartScreenViewController: StartScreenViewInput {

}

extension StartScreenViewController {
    
    func showDetailsFirst() {
        self.output.showNextScreen(parameter: "FirstTitle")
    }

    func showDetailsSecond() {
        self.output.showNextScreen(parameter: "SecondTitle")
    }

}
