//
//  SettingsViewController.swift
//  MapWeather
//
//  Created by Grace Njoroge on 16/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

  lazy var resetButton: UIButton = {
    let btn = UIButton()
    btn.setTitle(" Reset bookmarks ", for: .normal)
    btn.setTitleColor(.white, for: .normal)
    btn.backgroundColor = .systemBlue
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
  }()

  override func loadView() {
    super.loadView()
    setupView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    title = "Settings"
  }

  fileprivate func setupView() {
    view.addSubview(resetButton)
    NSLayoutConstraint.activate([
      resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      resetButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
    resetButton.addTarget(self, action: #selector(resetBookmarks), for: .touchUpInside)
  }

  @objc fileprivate func resetBookmarks() {

  }
}
