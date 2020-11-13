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
  }

  override func loadView() {
    super.loadView()
    setupScreens()
  }

  fileprivate func setupScreens() {
    let firstViewController = CurrentWeatherViewController()
    let secondViewController = ForecastViewController.init(collectionViewLayout: UICollectionViewFlowLayout())
    firstViewController.tabBarItem = UITabBarItem(title: "Today", image: UIImage(named: "current"), tag: 0)
    secondViewController.tabBarItem = UITabBarItem(title: "Forecast", image: UIImage(named: "future"), tag: 1)
    let tabBarList = [firstViewController, secondViewController]
    viewControllers = tabBarList
  }

}
