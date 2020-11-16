//
//  CurrentWeatherViewModel.swift
//  MapWeather
//
//  Created by Grace Njoroge on 12/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class CurrentWeatherViewModel {

  private let apiService = APIService()
  var currentWeather = [TodayWeather]()
  var forecast = [WeatherForecast]()

  func fetchCurrentWeather(coord: CLLocationCoordinate2D, completion: ((_ weather: TodayWeather) -> Void)?) {
    apiService.getWeatherFromCityName(coord: coord) { (json) in
      let results = ParseHelper.parseWeather(json: json)
      self.currentWeather.append(results)
      completion?(results)
    }
  }

  func fetchWeatherForecast(coord: CLLocationCoordinate2D, completion: ((_ weather: [WeatherForecast]) -> Void)?) {
    apiService.getWeatherForecastFromCityName(coord: coord) { (json) in
      let results = ParseHelper.parseForecast(json: json)
      self.forecast.append(contentsOf: results)
      completion?(results)
    }
  }

  public var count: Int {
    return forecast.count
  }
}

