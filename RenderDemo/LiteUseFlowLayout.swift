//
//  LiteUseFlowLayout.swift
//  RenderDemo
//
//  Created by Do Dinh Thy  Son  on 5/15/17.
//  Copyright © 2017 Do Dinh Thy  Son . All rights reserved.
//

import UIKit

class LiteUseFlowLayout : NSObject,  UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if indexPath.row == 0 {
      return CGSize(width: collectionView.frame.width, height: 350)
    }
    return CGSize(width: 140, height: 200)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
}
