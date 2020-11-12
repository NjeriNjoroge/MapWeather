//
//  CurrentView.swift
//  MapWeather
//
//  Created by Grace Njoroge on 12/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit

class CurrentView: UIView {

  //@IBOutlet weak var weatherIconImage: UIImageView!

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

  lazy var temperatureLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "12ºC"
    return label
  }()

  lazy var humidityLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "12ºC"
    return label
  }()

  lazy var windSpeedLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "5km/h"
    return label
  }()

    lazy var rainChanceLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "5%"
      return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }

  func setupView() {
    addSubview(curentLocationImage)
    addSubview(currentLocationLabel)

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

  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
