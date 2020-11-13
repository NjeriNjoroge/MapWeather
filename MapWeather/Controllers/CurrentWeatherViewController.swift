//
//  CurrentWeatherViewController.swift
//  MapWeather
//
//  Created by Grace Njoroge on 12/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {

  let weatherView = CurrentView()
  let viewModel = CurrentWeatherViewModel()

  override func loadView() {
    super.loadView()
    setupView()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    fetchWeather()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  fileprivate func setupView() {
    self.tabBarController?.title = "Today"
    weatherView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(weatherView)
    NSLayoutConstraint.activate([
      weatherView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
      weatherView.widthAnchor.constraint(equalTo: view.widthAnchor)
    ])
  }

  fileprivate func fetchWeather() {
    //fetch weather
    viewModel.fetchCurrentWeather(cityName: "Nairobi") { (weather) in
      //update ui
      DispatchQueue.main.async {
        self.weatherView.humidityLabel.text = "\(weather.humidity)"
        self.weatherView.temperatureLabel.text = "\(weather.temp)"
        self.weatherView.rainChanceLabel.text = "\(weather.rain)"
        self.weatherView.windSpeedLabel.text = "\(weather.wind)"
      }
    }
  }

}
