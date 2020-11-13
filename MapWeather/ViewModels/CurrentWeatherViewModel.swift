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

  func fetchCurrentWeather(cityName: String, completion: ((_ weather: TodayWeather) -> Void)?) {
    apiService.getWeatherFromCityName(city: cityName) { (json) in
      let results = ParseHelper.parseWeather(json: json)
      self.currentWeather.append(results)
      completion?(results)
    }
  }

//  func fetchWeatherForecast(cityName: String, completion: ((_ weather: CurrentWeather) -> Void)?) {
//    apiService.getWeatherForecastFromCityName(city: cityName) { (json) in
////      if let weatherObj = json {
////        let results = ParseHelper.parseWeather(json: weatherObj)
////
////      }
//      print(json)
//    }
//  }

  public var temperature: Double {
    return currentWeather[0].temp
  }
  public var weatherIcon: String {
    return currentWeather[0].icon
  }
  public var wind: Double {
    return currentWeather[0].wind
  }
  public var humidity: Int {
    return currentWeather[0].humidity
  }

  public var rain: Double {
    return currentWeather[0].rain
  }

  public var weatherIconUrl: URL {
    return URL(string: "http://openweathermap.org/img/wn/\(weatherIcon)@2x.png")!
  }
  
}

