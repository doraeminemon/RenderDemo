//
//  VerticalUserComponent.swift
//  RenderDemo
//
//  Created by Do Dinh Thy  Son  on 5/16/17.
//  Copyright © 2017 Do Dinh Thy  Son . All rights reserved.
//

import UIKit
import Render

class VerticalUserComponent : ComponentView<User> {
  override func construct(state: User?, size: CGSize) -> NodeType {
    let container = Node<UIView> { v, l, s in
      l.flexDirection = .column
      l.width = size.width
      l.alignItems = .center
    }
    
    let userImage = Node<UIImageView> { v, l, s in
      l.height = 100
      l.width = 100
      v.kf.setImage(with: state?.userProfileImageURL)
      v.layer.cornerRadius = l.height / 2
      v.layer.masksToBounds = true
    }
    
    let userLabel = Node<UILabel> { v, l, s in
      v.text = state?.title
    }
    
    let followButton = CommonNode.followButton
    return container.add(children: [userImage, userLabel, followButton])
  }
}
