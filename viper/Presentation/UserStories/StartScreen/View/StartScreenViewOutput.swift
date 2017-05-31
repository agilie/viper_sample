//
//  StartScreenViewOutput.swift
//  viper
//
//  Created by Sergii Avilov on 18/01/2017.
//  Copyright © 2017 Agilie. All rights reserved.
//

/**
 * View -> Presenter
 */
protocol StartScreenViewOutput {

	func setupInitialState(withArguments args: NamedValuesType, completion: ModuleCompletionHandler?)
  	func viewIsReady()
    
    func showWeatherDetails(cityId: Int)
    var cities: [City] { get }
    
}
