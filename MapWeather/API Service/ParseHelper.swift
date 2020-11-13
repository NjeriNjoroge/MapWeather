//
//  ParseHelper.swift
//  MapWeather
//
//  Created by Grace Njoroge on 13/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

//
//"feels_like": 22.17,
//       "temp_min": 23,
//       "temp_max": 25,
//       "pressure": 1020,
import Foundation

public class ParseHelper {
  static func parseWeather(json: CurrentWeather) -> TodayWeather {
    var weather = [TodayWeather]()
    let humid = json.main.humidity
    let ttemp = json.main.temp
    let windSpeed = json.wind.speed
    let rainChance = json.rain?.oneHour ?? 0.00
    var weatherIcon = ""
    json.weather.forEach { (weather) in
      weatherIcon = weather.icon

    }

    let weatherObject = TodayWeather(temp: ttemp, icon: weatherIcon, wind: windSpeed, rain: rainChance, humidity: humid)
    weather.append(weatherObject)

    return weatherObject
  }
}
