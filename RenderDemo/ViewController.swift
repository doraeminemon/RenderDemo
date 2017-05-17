//
//  ViewController.swift
//  RenderDemo
//
//  Created by Do Dinh Thy  Son  on 5/12/17.
//  Copyright © 2017 Do Dinh Thy  Son . All rights reserved.
//

import UIKit
import Render

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

  @IBOutlet weak var collectionView: UICollectionView!
  //MOCK DATA
  var dataSource : [ContentState] = [ContentState(username: "tyson",
                                                  title: "iamge",
                                                  image_url: URL(string: "https://media2.giphy.com/media/G9IN6GcdPAFVu/giphy.gif")!),
                                     ContentState(username: "brian",
                                                  title: "somethingelse",
                                                  image_url: URL(string:"https://placebear.com/140/140")!)]
  var user : User = User(title: "Tyson", profileImageURLString: "https://media2.giphy.com/media/G9IN6GcdPAFVu/giphy.gif")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = .gray
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(LiteUseHeaderCell.self, forCellWithReuseIdentifier: Constant.Identifier.header)
    collectionView.register(ComponentCollectionViewCell<ContentComponentView>.self, forCellWithReuseIdentifier: Constant.Identifier.cell)
    collectionView.reloadData()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  //MARK : COLLECTIONVIEW
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource.count + 1
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if indexPath.item == 0 {
      return headerCell(for: collectionView, at: indexPath)
    } else {
      return cell(for:collectionView, at: indexPath)
    }
  }
  
  func headerCell(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.Identifier.header, for: indexPath)
    guard let headerCell = cell as? LiteUseHeaderCell else {
      return cell
    }
    headerCell.userState = user
    headerCell.imageURL = URL(string:"https://www.placebear.com/375/350")
    return headerCell
  }
  
  func cell(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.Identifier.cell, for: indexPath)
    guard let componentCell = cell as? ComponentCollectionViewCell<ContentComponentView> else {
      print("Did not dequeue correctly")
      return cell
    }
    let state = dataSource[indexPath.item - 1]
    componentCell.mountComponentIfNecessary(ContentComponentView())
    componentCell.state = state
    componentCell.render()
    return componentCell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if indexPath.item == 0 {
      return CGSize(width: collectionView.bounds.width, height: 500)
    } else {
      return CGSize(width: 160, height: 200)
    }
  }
}

