//
//  ForecastViewController.swift
//  MapWeather
//
//  Created by Grace Njoroge on 12/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit

class ForecastViewController: UICollectionViewController {

  let viewModel = CurrentWeatherViewModel()
  var foreCast = [WeatherForecast]()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.tabBarController?.title = "Forecast"
    collectionView.backgroundColor = .white
    collectionView.register(ForecastCollectionViewCell.self, forCellWithReuseIdentifier: ForecastCollectionViewCell.reuseIdentifier)
  }

  override func loadView() {
    super.loadView()
    setupCollectionView()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    fetchForecast()
  }

  func fetchForecast() {
    viewModel.fetchWeatherForecast(cityName: "Nairobi") { (forecast) in
      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }
    }
    
  }

  func setupCollectionView() {
    view.addSubview(collectionView)
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: view.topAnchor),
      collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
      collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }

}
extension ForecastViewController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

    return viewModel.count
  }
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForecastCollectionViewCell.reuseIdentifier, for: indexPath) as! ForecastCollectionViewCell
    cell.humidityLabel.text = "\(viewModel.forecast[indexPath.row].humidity)%"
    cell.temperatureLabel.text = "\(viewModel.forecast[indexPath.row].temp)ºC"
    cell.rainChanceLabel.text = "\(viewModel.forecast[indexPath.row].rain)mm"
   cell.windSpeedLabel.text = "\(viewModel.forecast[indexPath.row].wind)m/s"
    return cell
  }

}

extension ForecastViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return ForecastCollectionViewCell.defaultSize
  }
}
