//
//  UICollectionViewAdditions.swift
//  Inploi
//
//  Created by Khoi Truong Minh on 7/9/16.
//  Copyright © 2016 Innovatube. All rights reserved.
//

import UIKit


extension UICollectionView {
    
    func registerNibLoadableCell<T: UICollectionViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    func registerNibLoadableCells<T: UICollectionViewCell>(types: [T.Type]) where T: ReusableView, T: NibLoadableView {
        for type in types {
            registerNibLoadableCell(type)
        }
    }

    func registerNibLoadableHeader<T: UICollectionReusableView>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier)
    }

    func registerNibLoadableHeaders<T: UICollectionReusableView>(types: [T.Type]) where T: ReusableView, T: NibLoadableView {
        for type in types {
            registerNibLoadableHeader(type)
        }
    }

    func registerNibLoadableFooter<T: UICollectionReusableView>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: T.reuseIdentifier)
    }

    func registerNibLoadableFooters<T: UICollectionReusableView>(types: [T.Type]) where T: ReusableView, T: NibLoadableView {
        for type in types {
            registerNibLoadableFooter(type)
        }
    }

    func dequeueReusableCell<T: UICollectionViewCell>(type: T.Type, forIndexPath indexPath: NSIndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }

    func dequeueHeaderView<T: UICollectionReusableView>(type: T.Type, forIndexPath indexPath: NSIndexPath) -> T where T: ReusableView {
        guard let header = dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue header view with identifier: \(T.reuseIdentifier)")
        }
        return header
    }

    func dequeueFooterView<T: UICollectionReusableView>(type: T.Type, forIndexPath indexPath: NSIndexPath) -> T where T: ReusableView {
        guard let footer = dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue footer view with identifier: \(T.reuseIdentifier)")
        }
        return footer
    }

}
