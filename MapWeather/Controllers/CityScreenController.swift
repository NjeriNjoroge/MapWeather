//
//  CityScreenController.swift
//  MapWeather
//
//  Created by Grace Njoroge on 12/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit

class CityScreenController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .white

       let firstViewController = CurrentWeatherViewController()

      firstViewController.tabBarItem = UITabBarItem(title: "Today", image: nil, tag: 0)

        let secondViewController = ForecastViewController()

        secondViewController.tabBarItem = UITabBarItem(title: "Forecast", image: nil, tag: 1)

        let tabBarList = [firstViewController, secondViewController]

        viewControllers = tabBarList
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
