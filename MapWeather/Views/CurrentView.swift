//
//  CurrentView.swift
//  MapWeather
//
//  Created by Grace Njoroge on 12/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit

class CurrentView: UIView {

  lazy var curentLocationImage: UIImageView = {
    let img = UIImageView()
    img.image = UIImage(named: "sun")
    img.translatesAutoresizingMaskIntoConstraints = false
    img.contentMode = .scaleAspectFit
    return img
  }()

  lazy var currentLocationLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Nairobi"
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

  lazy var firstContainerView: UIView = {
    let view = UIView()
    //view.backgroundColor = UIColor(hexString: "#47ab2f")
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }

  func setupView() {
    addSubview(curentLocationImage)
    addSubview(currentLocationLabel)
    addSubview(imageStackView)
    addSubview(detailStackView)

    NSLayoutConstraint.activate([
      curentLocationImage.topAnchor.constraint(equalTo: topAnchor),
      curentLocationImage.centerXAnchor.constraint(equalTo: centerXAnchor),
      curentLocationImage.heightAnchor.constraint(equalToConstant: 100),
      curentLocationImage.widthAnchor.constraint(equalToConstant: 100)
    ])

    NSLayoutConstraint.activate([
      currentLocationLabel.topAnchor.constraint(equalTo: curentLocationImage.bottomAnchor, constant: 10),
      currentLocationLabel.centerXAnchor.constraint(equalTo: curentLocationImage.centerXAnchor),
    ])

    NSLayoutConstraint.activate([
      imageStackView.topAnchor.constraint(equalTo: currentLocationLabel.bottomAnchor, constant: 20),
      imageStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      imageStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      imageStackView.heightAnchor.constraint(equalToConstant: 30)
    ])

    NSLayoutConstraint.activate([
      detailStackView.topAnchor.constraint(equalTo: imageStackView.bottomAnchor, constant: 5),
      detailStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      detailStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
