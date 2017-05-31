//
//  DetailsScreenViewController.swift
//  viper
//
//  Created by Sergii Avilov on 19/01/2017.
//  Copyright © 2017 Agilie. All rights reserved.
//

import UIKit

class DetailsScreenViewController: UIViewController {

    // MARK:
    var output: DetailsScreenViewOutput!
    var cityId: Int = 0

   	// MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details Screen"
        if let city = output.city(with: cityId) {
            title = city.title
        }
        output.viewIsReady()
        output.requestWeather(for: cityId)
    }
    
    // MARK: Handlers
    
    // MARK: Outlets
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var cloundsLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    
}

// MARK:
extension DetailsScreenViewController: ModuleInputProtocol {

    func setupInitialState(withArguments args: NamedValuesType, completion: ModuleCompletionHandler?) {
        cityId = Int(args["cityId"] as! String)!
        output.setupInitialState(withArguments: args, completion: completion)
    }
}

// MARK:
extension DetailsScreenViewController: DetailsScreenViewInput {

    func assignWeather(_ weather: CurrentWeather) {
        reloadUI(with: weather)
    }
    
}

extension DetailsScreenViewController {
    
    func reloadUI(with weather: CurrentWeather) {
        temperatureLabel.text = weather.temperatureString
        humidityLabel.text = weather.humidityString
        pressureLabel.text = weather.pressureString
        temperatureLabel.text = weather.temperatureString
        windLabel.text = weather.windString
        cloundsLabel.text = weather.cloudsString
        visibilityLabel.text = weather.visibilityString
    }
    
}
