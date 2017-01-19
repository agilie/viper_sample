//
//  DetailsScreenViewOutput.swift
//  viper
//
//  Created by Sergii Avilov on 19/01/2017.
//  Copyright © 2017 Agilie. All rights reserved.
//

/**
 * View -> Presenter
 */
protocol DetailsScreenViewOutput {

	func setupInitialState(withArguments args: NamedValuesType, completion: ModuleCompletionHandler?)
  	func viewIsReady()
}
