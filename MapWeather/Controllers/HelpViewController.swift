//
//  HelpViewController.swift
//  MapWeather
//
//  Created by Grace Njoroge on 14/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit
import WebKit

class HelpViewController: UIViewController, WKNavigationDelegate {

  var webView: WKWebView!
//  lazy var spinner: UIActivityIndicatorView = {
//    let ai = UIActivityIndicatorView(style: .gray)
//    ai.translatesAutoresizingMaskIntoConstraints = false
//    ai.hidesWhenStopped = true
//    return ai
//  }()


  override func loadView() {
    super.loadView()
    webView = WKWebView()
    self.view = webView
    webView.navigationDelegate = self
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    title = "Help"
    loadHtml()
  }

  fileprivate func loadHtml() {
    let html = """
      <!DOCTYPE html>
      <html>
          <head>
              <meta name="viewport" content="width=device-width, initial-scale=1">
          </head>
          <body>
              <h1>Help</h1>
              <h2> How to use the map</h2>
                  <p>Pinch and zoom the map to scroll through it</p>
                  <p>To add a bookmark click a location on the map, click on the accessory button. Add a bookmark in order to view the weather of the location.</p>
                  <p>Double click the bookmark name in order to view weather</p>
          </body>
      </html>
      """
    webView.loadHTMLString(html, baseURL: nil)
  }

}
