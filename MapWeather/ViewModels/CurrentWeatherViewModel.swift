//
//  CurrentWeatherViewModel.swift
//  MapWeather
//
//  Created by Grace Njoroge on 12/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import Foundation
import UIKit

class CurrentWeatherViewModel {

  private let apiService = APIService()
  var currentWeather = [TodayWeather]()
  var forecast = [WeatherForecast]()

  func fetchCurrentWeather(cityName: String, completion: ((_ weather: TodayWeather) -> Void)?) {
    apiService.getWeatherFromCityName(city: cityName) { (json) in
      let results = ParseHelper.parseWeather(json: json)
      self.currentWeather.append(results)
      completion?(results)
    }
  }

  func fetchWeatherForecast(cityName: String, completion: ((_ weather: [WeatherForecast]) -> Void)?) {
    apiService.getWeatherForecastFromCityName(city: cityName) { (json) in
      let results = ParseHelper.parseForecast(json: json)
      self.forecast.append(contentsOf: results)
      completion?(results)
    }
  }

  public var count: Int {
    return forecast.count
  }
}

