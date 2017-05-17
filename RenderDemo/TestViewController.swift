//
//  TestViewController.swift
//  RenderDemo
//
//  Created by Do Dinh Thy  Son  on 5/16/17.
//  Copyright © 2017 Do Dinh Thy  Son . All rights reserved.
//

import UIKit

class TestViewController : UIViewController {
  
  override func viewDidLoad() {
    let component = VerticalUserComponent()
    let user = User(title: "Tyson",
                    profileImageURLString: "https://media2.giphy.com/media/G9IN6GcdPAFVu/giphy.gif")
    component.state = user
    component.render(in: view.bounds.size, options: [])
    view.addSubview(component)
  }
  
  
}
