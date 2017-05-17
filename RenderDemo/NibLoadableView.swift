//
//  Nib.swift
//  Inploi
//
//  Created by Khoi Truong Minh on 7/7/16.
//  Copyright © 2016 Innovatube. All rights reserved.
//

import UIKit

protocol NibLoadableView: class {

    static var nibName: String { get }

}

extension NibLoadableView where Self: UIView {

    static var nibName: String {
        return String(describing: Self.self)
    }
  
}

extension NibLoadableView where Self: UIView {

    static func instantiateView() -> Self {
        guard let view = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first as? Self else {
            fatalError("Can not load nib with name '\(nibName)'")
        }
        return view
    }

}
