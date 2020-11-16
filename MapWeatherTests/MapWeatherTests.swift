//
//  MapWeatherTests.swift
//  MapWeatherTests
//
//  Created by Grace Njoroge on 11/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import XCTest
import MapKit

@testable import MapWeather

class MapWeatherTests: XCTestCase {

  let location = CLLocationCoordinate2D(latitude: 14.42, longitude: 50.09)

  var sut: HomeViewController!
  var api: APIService!
  var viewmodel: CurrentWeatherViewModel!

  override func setUpWithError() throws {
    sut = HomeViewController()
    api = APIService()
    viewmodel = CurrentWeatherViewModel()
    sut.loadViewIfNeeded()
  }

  override func tearDownWithError() throws {
    sut = nil
    api = nil
  }

  func testApiWeatherEndPointWorks() {
    let exp = XCTestExpectation(description: "get weather")
    let coord = CLLocationCoordinate2D(latitude: 55.7, longitude: 37.6)
    viewmodel.fetchCurrentWeather(coord: coord) { (weather) in
      if weather == nil {
        XCTFail()
      }
      // The request is finished, so our expectation
      exp.fulfill()
    }

    // We ask the unit test to wait our expectation to finish.
    wait(for: [exp], timeout: 100)
  }

  func testApiForecastEndPointWorks() {
    let exp = XCTestExpectation(description: "get forecast")
    let coord = CLLocationCoordinate2D(latitude: 55.7, longitude: 37.6)
    viewmodel.fetchWeatherForecast(coord: coord) { (forecast) in
      if forecast.isEmpty {
        XCTFail()
      }
      // The request is finished, so our expectation
      exp.fulfill()
    }

    // We ask the unit test to wait our expectation to finish.

    wait(for: [exp], timeout: 100)
  }

  func testDateConversion() {
    let dateFromJson = "2020-10-16 09:00:00"
    let convertedDate = ParseHelper.convertUtcToLocalTime(date: dateFromJson)
    XCTAssertNotEqual(dateFromJson, convertedDate)
  }
}





