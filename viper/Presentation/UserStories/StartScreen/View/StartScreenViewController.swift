//
//  StartScreenViewController.swift
//  viper
//
//  Created by Sergii Avilov on 18/01/2017.
//  Copyright © 2017 Agilie. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {

    // MARK:
    var output: StartScreenViewOutput!

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

extension StartScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier") else { return UITableViewCell() }
        let city = output.cities[indexPath.row]
        cell.textLabel?.text = city.title
        return cell
    }
    
}

extension StartScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = output.cities[indexPath.row]
        showWeather(for: city.id)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension StartScreenViewController {
    
    func showWeather(for cityId: Int) {
        self.output.showWeatherDetails(cityId: cityId)
    }

}
