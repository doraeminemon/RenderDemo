//
//  LiteUseHeaderCell.swift
//  RenderDemo
//
//  Created by Do Dinh Thy  Son  on 5/16/17.
//  Copyright © 2017 Do Dinh Thy  Son . All rights reserved.
//

import UIKit
import Render

class LiteUseHeaderCell : UICollectionViewCell {
  
  public var userState : User? {
    didSet {
      userComponentView.state = userState
    }
  }
  
  public var imageURL : URL? {
    didSet {
      backgroundImageView.kf.setImage(with: imageURL)
    }
  }
  
  var userComponentView = VerticalUserComponent()
  var backgroundImageView = UIImageView()
  var backgroundImageViewHeight : CGFloat = 350
  
  override func layoutSubviews() {
    super.layoutSubviews()
    backgroundImageView.frame.size = CGSize(width: self.bounds.size.width, height: backgroundImageViewHeight)
    userComponentView.render(in: self.bounds.size, options: [])
    userComponentView.frame.origin = CGPoint(x: 0, y: backgroundImageView.frame.height - 50 )
    addSubview(backgroundImageView)
    addSubview(userComponentView)
  }
}
