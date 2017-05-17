//
//  CollectionNode.swift
//  RenderDemo
//
//  Created by Do Dinh Thy  Son  on 5/12/17.
//  Copyright © 2017 Do Dinh Thy  Son . All rights reserved.
//

import UIKit
import Render

/** Wraps a UICollectionView in a node definition.
 *  TableNode.children will be wrapped into UICollectionViewCell.
 *  Consider using TableNode over Node<ScrollView> where you have a big number of items to be
 *  displayed.
 */
public class CollectionNode: NSObject, NodeType, UICollectionViewDataSource, UICollectionViewDelegate {
  
  /** TableNode redirects all of the layout calls to a Node<TableView>.
   *  Essentially this class is just a proxy in oder to hide the 'children' collection to the
   *  node hierarchy and to implement the UICollectionView's datasource.
   */
  private let node: Node<UICollectionView>
  
  /** The UICollectionView associated to this node. */
  public var renderedView: UIView? {
    return node.renderedView
  }
  
  /** The unique identifier for this node is its hierarchy. */
  public let identifier: String
  
  /** Set this property to 'true' if you want to disable the built-in cell reuse mechanism.
   *  This could be beneficial when the number of items is limited and you wish to improve the
   *  overall scroll performance.
   */
  public var disableCellReuse: Bool = false
  
  /** This component is the n-th children. */
  public var index: Int = 0 {
    didSet {
      node.index = index
    }
  }
  
  private var _children: [NodeType] = []
  
  /** The children are bypassed and used to implement the UICollectionView's datasource. */
  public var children: [NodeType] {
    set {
      var index = 0
      let children = newValue.filter { child in !(child is NilNode) }
      for child in children where !(child is NilNode) {
        child.index = index
        index += 1
      }
      _children = children;
    }
    get {
      return []
    }
  }
  
  /** Adds the nodes passed as argument as subnodes. */
  @discardableResult public func add(children: [NodeType]) -> NodeType {
    self.children += children
    return self
  }
  
  /** Adds the node passed as argument as subnode. */
  @discardableResult public func add(child: NodeType) -> NodeType {
    self.children = children + [child]
    return self
  }
  
  public init(identifier: String = "CollectionNode",
              children: [NodeType] = [],
              create: @escaping Node<UICollectionView>.CreateBlock = { return UICollectionView() },
              configure: @escaping Node<UICollectionView>.ConfigureBlock = { _ in }) {
    
    self.node = Node(identifier: identifier,
                     resetBeforeReuse: false,
                     children: [],
                     create: create,
                     configure: configure)
    self._children = children
    self.identifier = identifier
  }
  
  /** Re-applies the configuration closures to the UICollectionView and reload the data source. */
  public func render(in bounds: CGSize) {
    node.render(in: bounds)
    if let collection = self.renderedView as? UICollectionView {
//      let nib = UINib(nibName: identifier, bundle : nil)
//      collection.register(nib, forCellWithReuseIdentifier: identifier)
      collection.dataSource = self
      collection.reloadData()
    }
  }
  
  public func internalConfigure(in bounds: CGSize) {
    node.internalConfigure(in: bounds)
  }
  
  /** 'willRender' is not yet supported for TableNode. */
  public func willRender() { }
  
  /** 'didRender' is not yet supported for TableNode. */
  public func didRender() { }
  
  public func build(with reusable: UIView?) {
    node.build(with: reusable)
  }
  
  //MARK: - UICollectionViewDataSource
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self._children.count
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let node = self._children[indexPath.item]
    var identifier = node.identifier
    
    if self.disableCellReuse {
      identifier = "\(identifier)_\(indexPath.item)"
    }
    
    
    let cell: ComponentCollectionViewCell<NilStateComponentView> = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as?
      ComponentCollectionViewCell<NilStateComponentView> ?? ComponentCollectionViewCell<NilStateComponentView>()
    
    cell.mountComponentIfNecessary(NilStateComponentView())
    cell.componentView?.constructBlock = { _, _ in return node }
    
    node.render(in: collectionView.bounds.size)
    cell.render(in: collectionView.bounds.size, options: [])
    
    return cell
  }
  
  public func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
}
