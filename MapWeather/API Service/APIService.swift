//
//  APIService.swift
//  MapWeather
//
//  Created by Grace Njoroge on 11/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import Foundation

struct API {
  static let APIKey = "0fd65ae8051cec4f21c386659c25955b"
  static let openWeatherBaseURL = "https://api.openweathermap.org/data/2.5/weather"
  static let openWeatherForecastBaseURL = "https://api.openweathermap.org/data/2.5/forecast"
}

class APIService {

//Current weather API call
  func getWeatherFromCityName(city: String, completion: @escaping (CurrentWeather?) -> ()) {
    if API.APIKey == "" {
      fatalError("use your own OpenWeather API key here")
    }
    guard let weatherRequestURL = URL(string: "\(API.openWeatherBaseURL)?appid=\(API.APIKey)&q=\(city)") else {
      completion(nil)
      return
    }

    // The data task retrieves the data.
    let dataTask = URLSession.shared.dataTask(with: weatherRequestURL) { (data, response, error) in
      if error != nil {
        print("error 1")
        completion(nil)
      }

        do {
          let weatherData = try JSONDecoder().decode(CurrentWeather.self, from: data!)
          completion(weatherData)
        } catch {
          print("Error in catch \(error)")
          completion(nil)
        }
    }
    dataTask.resume()
  }


//Forecast API call
  func getWeatherForecastFromCityName(city: String, completion: @escaping (WeatherForecast?) -> ()) {
    if API.APIKey == "" {
      fatalError("use your own OpenWeather API key here")
    }
    guard let weatherRequestURL = URL(string: "\(API.openWeatherForecastBaseURL)?appid=\(API.APIKey)&q=\(city)") else {
      completion(nil)
      return
    }

    // The data task retrieves the data.
    let dataTask = URLSession.shared.dataTask(with: weatherRequestURL) { (data, response, error) in
      if error != nil {
        print("error 1")
        completion(nil)
      }
        do {
          let weatherForecastData = try JSONDecoder().decode(WeatherForecast.self, from: data!)
          completion(weatherForecastData)
        } catch {
          print("Error in catch \(error)")
          completion(nil)
        }
    }
    dataTask.resume()
  }


}
