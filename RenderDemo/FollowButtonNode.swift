//
//  FollowButtonNode.swift
//  RenderDemo
//
//  Created by Do Dinh Thy  Son  on 5/15/17.
//  Copyright © 2017 Do Dinh Thy  Son . All rights reserved.
//

import UIKit
import Render

struct CommonNode {
  static let followButton = Node<UIButton> { v, l, s in
    l.alignSelf = .center
    l.height = 30
    l.width = 70
    v.setTitle("Follow", for: .normal)
    v.titleLabel?.textAlignment = .center
    v.tintColor = .white
    v.layer.borderWidth = 0.5
    v.layer.borderColor = UIColor.white.cgColor
    v.layer.cornerRadius = l.height / 2
  }
}

