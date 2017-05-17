//
//  ContentComponent.swift
//  RenderDemo
//
//  Created by Do Dinh Thy  Son  on 5/12/17.
//  Copyright © 2017 Do Dinh Thy  Son . All rights reserved.
//

import Foundation
import Render
import UIKit
import Kingfisher

struct ContentState : StateType {
  let username: String
  let title : String
  let image_url : URL
}

class ContentComponentView : ComponentView<ContentState> {
  override func construct(state: ContentState?, size: CGSize = CGSize(width: 140, height: 200)) -> NodeType {
    let imageView = Node<UIImageView> { view, layout, size in
      layout.width = size.width
      layout.height = 120
      layout.alignItems = .center
      view.kf.setImage(with: state?.image_url)
      view.layer.cornerRadius = 8
    }
    
    let usernameLabel = Node<UILabel> { view, layout, size in
      layout.width = size.width
      layout.height = 20
      view.text = state?.username
    }
    
    let titleLabel = Node<UILabel> { view, layout, size in
      layout.width = size.width
      layout.height = 20
      view.text = state?.title
    }
    
    let container = Node<UIView> { view, layout, size in
      layout.width = size.width
      layout.height = 200
      view.layer.borderColor = UIColor.black.cgColor
      view.layer.borderWidth = 0.5
    }
    
    return container.add(children: [imageView, titleLabel, usernameLabel])
  }
}
