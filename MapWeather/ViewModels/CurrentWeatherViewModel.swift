//
//  CurrentWeatherViewModel.swift
//  MapWeather
//
//  Created by Grace Njoroge on 12/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import Foundation

class CurrentWeatherViewModel {

  private let apiService = APIService()

  func fetchCurrentWeather(cityName: String, completion: ((_ weather: CurrentWeather) -> Void)?) {
    apiService.getWeatherFromCityName(city: cityName) { (json) in
      print("view model \(json)")
    }
  }

  func fetchWeatherForecast(cityName: String, completion: ((_ weather: CurrentWeather) -> Void)?) {
    apiService.getWeatherForecastFromCityName(city: cityName) { (json) in
      print(json)
    }
  }
  
}

