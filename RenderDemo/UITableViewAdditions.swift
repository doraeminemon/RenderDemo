//
//  UITableViewAdditions.swift
//  Inploi
//
//  Created by Khoi Truong Minh on 7/7/16.
//  Copyright © 2016 Innovatube. All rights reserved.
//

import UIKit

extension UITableView {

    func updateTableHeaderViewSize(size: CGSize) {
        let headerView = tableHeaderView
        headerView?.setNeedsLayout()
        headerView?.layoutIfNeeded()
        headerView?.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        tableHeaderView = headerView
    }

    func updateTableHeaderViewHeight(height: CGFloat) {
        updateTableHeaderViewSize(size: CGSize(width: bounds.size.width, height: height))
    }

    func updateTableFooterViewSize(size: CGSize) {
        let footerView = tableFooterView
        footerView?.setNeedsLayout()
        footerView?.layoutIfNeeded()
        footerView?.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        tableFooterView = footerView
    }

    func updateTableFooterViewHeight(height: CGFloat) {
        updateTableFooterViewSize(size: CGSize(width: bounds.size.width, height: height))
    }

}

extension UITableView {

    func registerNibLoadableCell<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func registerNibLoadableCells<T: UITableViewCell>(types: [T.Type]) where T: ReusableView, T: NibLoadableView {
        for type in types {
            registerNibLoadableCell(type)
        }
    }

}

extension UITableView {

    func dequeueReusableCell<T: UITableViewCell>(type: T.Type, forIndexPath indexPath: NSIndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }

    func dequeueReusableCell<T: UITableViewCell>(type: T.Type) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }

}
