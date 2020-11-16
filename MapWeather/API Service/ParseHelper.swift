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
  //current weather
  static func parseWeather(json: CurrentWeather) -> TodayWeather {

    var weather = [TodayWeather]()

    let humid = json.main.humidity
    let ttemp = json.main.temp
    let windSpeed = json.wind.speed
    let rainChance = json.rain?.the1h ?? 0.00
    var weatherIcon = ""
    json.weather.forEach { (weather) in
      weatherIcon = weather.icon
    }

    let weatherObject = TodayWeather(temp: ttemp, icon: weatherIcon, wind: windSpeed, rain: rainChance, humidity: humid)
    weather.append(weatherObject)

    return weatherObject
  }

  static func convertUtcToLocalTime (date :String) -> String {

    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"

    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "cccc"

    let localeDate = dateFormatterGet.date(from: date)
    return dateFormatterPrint.string(from: localeDate!)
  }

  //forecast weather
  static func parseForecast(json: Weather) -> [WeatherForecast] {
    

    var weather = [WeatherForecast]()

//    for all in json.list {
//      let rain = all.rain?.the3H ?? 0.00
//      let wind = all.wind.speed
//      let weatherIcon = all.weather[0].icon
//      let humid = all.main.humidity
//      let temp = all.main.temp
//      let date = all.dtTxt
//      let theDate = self.convertUtcToLocalTime(date: date)
//      let forecastObj = WeatherForecast(temp: temp, icon: weatherIcon, wind: wind, rain: rain, humidity: humid, forecastDate: theDate)
//      if weather.contains( where: { $0.forecastDate == forecastObj.forecastDate } ) == false {
//         weather.append(forecastObj)
//      }
//       weather.append(forecastObj)
//    }

    json.list.forEach { (forecast) in
      let rain = forecast.rain?.the3H ?? 0.00
      let wind = forecast.wind.speed
      let weatherIcon = forecast.weather[0].icon
      let humid = forecast.main.humidity
      let temp = forecast.main.temp
      let date = forecast.dtTxt
      let theDate = self.convertUtcToLocalTime(date: date)
      guard let ikon = weatherIcon else {return}
      let forecastObj = WeatherForecast(temp: temp, icon: ikon, wind: wind, rain: rain, humidity: humid, forecastDate: theDate)
      if weather.contains( where: { $0.forecastDate == forecastObj.forecastDate } ) == false {
        weather.append(forecastObj)
      }
    }



//    let wind = json.list[0].wind.speed
//    let rain = json.list[0].rain?.the3H ?? 0.00
//    let weatherIcon = json.list[0].weather[0].icon
//    let temp = json.list[0].main.temp
//    let humid = json.list[0].main.humidity
    
//    let forecastObj = WeatherForecast(temp: temp, icon: weatherIcon, wind: wind, rain: rain, humidity: humid)
//    weather.append(forecastObj)

    return weather
  }

}
