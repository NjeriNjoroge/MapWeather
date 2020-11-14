//
//  ForecastCollectionViewCell.swift
//  MapWeather
//
//  Created by Grace Njoroge on 12/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit

class ForecastCollectionViewCell: UICollectionViewCell {

  static let reuseIdentifier = "cell"
  static var defaultSize = CGSize(width: UIScreen.main.bounds.width, height: 80)

  lazy var dayLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .systemTeal
    label.text = "Monday"
    return label
  }()

  lazy var temperatureImage: UIImageView = {
    let img = UIImageView()
    img.image = UIImage(named: "heat")
    img.translatesAutoresizingMaskIntoConstraints = false
    img.contentMode = .scaleAspectFit
    return img
  }()

  lazy var temperatureLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.text = "12ºC"
    return label
  }()

  lazy var humidityImage: UIImageView = {
    let img = UIImageView()
    img.image = UIImage(named: "humidity")
    img.translatesAutoresizingMaskIntoConstraints = false
    img.contentMode = .scaleAspectFit
    return img
  }()

  lazy var humidityLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.text = "12ºC"
    return label
  }()

  lazy var windImage: UIImageView = {
    let img = UIImageView()
    img.image = UIImage(named: "wind")
    img.translatesAutoresizingMaskIntoConstraints = false
    img.contentMode = .scaleAspectFit
    return img
  }()

  lazy var windSpeedLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.text = "5km/h"
    return label
  }()

  lazy var rainImage: UIImageView = {
    let img = UIImageView()
    img.image = UIImage(named: "rain")
    img.translatesAutoresizingMaskIntoConstraints = false
    img.contentMode = .scaleAspectFit
    return img
  }()

  lazy var rainChanceLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.text = "5%"
    return label
  }()

  lazy var imageStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [temperatureImage, humidityImage, rainImage, windImage])
    stackView.axis = .horizontal
    stackView.alignment = .leading
    stackView.distribution = .fillEqually
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()

  lazy var detailStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [temperatureLabel, humidityLabel, rainChanceLabel, windSpeedLabel])
    stackView.axis = .horizontal
    stackView.alignment = .center
    stackView.distribution = .fillEqually
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()

  lazy var detailsContainerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  lazy var imageContainerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  func setupViews() {
    addSubview(dayLabel)
    addSubview(imageContainerView)
    addSubview(detailsContainerView)
    imageContainerView.addSubview(imageStackView)
    detailsContainerView.addSubview(detailStackView)
    NSLayoutConstraint.activate([
      dayLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      dayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
    ])
    NSLayoutConstraint.activate([
       imageStackView.heightAnchor.constraint(equalToConstant: 30),
       imageStackView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
       imageStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
       imageStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
     ])
     NSLayoutConstraint.activate([
      imageContainerView.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 5),
       imageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
       imageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor)
     ])
    NSLayoutConstraint.activate([
      detailStackView.topAnchor.constraint(equalTo: detailsContainerView.topAnchor),
      detailStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      detailStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      detailStackView.bottomAnchor.constraint(equalTo: detailsContainerView.bottomAnchor)
    ])
    NSLayoutConstraint.activate([
      detailsContainerView.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor, constant: 30),
      detailsContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
      detailsContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
      detailsContainerView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])

  }

//  func update() {
//    humidityLabel.text = "\(forecast.humidity)%"
//    temperatureLabel.text = "\(forecast.temp)ºC"
//    rainChanceLabel.text = "\(forecast.rain)mm"
//    windSpeedLabel.text = "\(forecast.wind)m/s"
//  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
