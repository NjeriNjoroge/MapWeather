//
//  CurrentWeatherViewController.swift
//  MapWeather
//
//  Created by Grace Njoroge on 12/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit
import MapKit

protocol GetCityNameAndCoordinates: class {
  func getDeets(cityname: String, coord: CLLocationCoordinate2D)
}

class CurrentWeatherViewController: UIViewController {

  let weatherView = CurrentView()
  let viewModel = CurrentWeatherViewModel()
  var theCityNameText = ""
  var cityCoordinates = CLLocationCoordinate2D()
  var whositheDelegate: GetCityNameAndCoordinates?

  lazy var forecastLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Forecast"
    return label
  }()

  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    cv.translatesAutoresizingMaskIntoConstraints = false
    cv.backgroundColor = .groupTableViewBackground
    return cv
  }()

  lazy var secondContainerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  lazy var firstContainerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupCollectionView()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    fetchWeather(theCityNameText)
    fetchForecast(theCityNameText)
  }

  override func loadView() {
    super.loadView()
    setupView()
    setupForecastView()
  }

  func setupCollectionView() {
    collectionView.register(ForecastCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    collectionView.delegate = self
    collectionView.dataSource = self
  }

  fileprivate func setupView() {
    let screenSize = UIScreen.main.bounds.size
    let height = screenSize.height

    view.addSubview(firstContainerView)
    weatherView.translatesAutoresizingMaskIntoConstraints = false
    firstContainerView.addSubview(weatherView)

    NSLayoutConstraint.activate([
        firstContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
        firstContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        firstContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        firstContainerView.heightAnchor.constraint(equalToConstant: height/3)
      ])

    NSLayoutConstraint.activate([
      weatherView.topAnchor.constraint(equalTo: firstContainerView.topAnchor),
      weatherView.leadingAnchor.constraint(equalTo: firstContainerView.leadingAnchor),
      weatherView.trailingAnchor.constraint(equalTo: firstContainerView.trailingAnchor)
    ])
  }

  func setupForecastView() {
    view.addSubview(secondContainerView)
    NSLayoutConstraint.activate([
      secondContainerView.topAnchor.constraint(equalTo: firstContainerView.bottomAnchor),
      secondContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      secondContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      secondContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
     secondContainerView.addSubview(collectionView)
     NSLayoutConstraint.activate([
       collectionView.topAnchor.constraint(equalTo: secondContainerView.topAnchor),
       collectionView.leadingAnchor.constraint(equalTo: secondContainerView.leadingAnchor),
       collectionView.trailingAnchor.constraint(equalTo: secondContainerView.trailingAnchor),
       collectionView.bottomAnchor.constraint(equalTo: secondContainerView.bottomAnchor)
     ])
   }

  fileprivate func fetchWeather(_ cityName: String) {
    //fetch weather
    viewModel.fetchCurrentWeather(coord: cityCoordinates) { (weather) in
      //update ui
      DispatchQueue.main.async {
        self.weatherView.humidityLabel.text = "\(weather.humidity)%"
        self.weatherView.temperatureLabel.text = "\(weather.temp)ºC"
        self.weatherView.rainChanceLabel.text = "\(weather.rain)mm"
        self.weatherView.windSpeedLabel.text = "\(weather.wind)m/s"
        self.weatherView.curentLocationImage.image = UIImage(named: weather.icon)
      }
    }
  }

  func fetchForecast(_ cityName: String) {
    viewModel.fetchWeatherForecast(coord: cityCoordinates) { (forecast) in
      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }
    }
  }
}

extension CurrentWeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForecastCollectionViewCell.reuseIdentifier, for: indexPath) as! ForecastCollectionViewCell
     cell.humidityLabel.text = "\(viewModel.forecast[indexPath.row].humidity)%"
     cell.temperatureLabel.text = "\(viewModel.forecast[indexPath.row].temp)ºC"
     cell.rainChanceLabel.text = "\(viewModel.forecast[indexPath.row].rain)mm"
    cell.windSpeedLabel.text = "\(viewModel.forecast[indexPath.row].wind)m/s"
    cell.dayLabel.text = "\(viewModel.forecast[indexPath.row].forecastDate)"
     return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.bounds.width, height: 100)
  }
}

extension CurrentWeatherViewController: GetCityNameAndCoordinates {
  func getDeets(cityname: String, coord: CLLocationCoordinate2D) {
    theCityNameText = cityname
    fetchWeather(cityname)
    fetchForecast(cityname)
    weatherView.currentLocationLabel.text = cityname
  }
}
