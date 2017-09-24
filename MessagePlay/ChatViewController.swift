//
//  ChatViewController.swift
//  MessagePlay
//
//  Created by Kevin Remigio on 9/22/17.
//  Copyright © 2017 Kevin Remigio. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    var collectionView: UICollectionView? = nil
    var varLayout: UIEdgeInsets! = nil
    var varItemSize: CGSize! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cFrame: CGRect = view.frame
//        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
//        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
//        layout.itemSize = CGSize(width: 40, height: 40)
//        layout.minimumLineSpacing = 4
//        layout.scrollDirection = .vertical
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        if varLayout == nil {
            layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        } else {
            layout.sectionInset = varLayout
        }
        
        if varItemSize == nil {
            layout.itemSize = CGSize(width: 100, height: 100)
        } else {
            layout.itemSize = varItemSize
        }
        
        collectionView = UICollectionView(frame: cFrame, collectionViewLayout: layout)
        collectionView?.backgroundColor = UIColor.init(colorLiteralRed: 37/255, green: 57/255, blue: 107/255, alpha: 1.0)
        collectionView?.dataSource = self
        collectionView?.delegate =  self
        collectionView?.isScrollEnabled = true
        
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "colcell")
        
        let row = IndexPath(row: 31, section: 0)
        collectionView?.scrollToItem(at: row, at: .bottom, animated: false)
        
        view.addSubview(collectionView!)
        //collectionView?.contentOffset = CGPoint(x: 0, y: collectionView!.contentSize.height - collectionView!.bounds.size.height)
    }

}

extension ChatViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 32
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colcell",
                                                      for: indexPath)
        cell.backgroundColor = UIColor.white
        // Configure the cell
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
////        if indexPath.row % 2 == 0 {
////            return CGSize(width: view.frame.width - 50, height: 120)
////        } else {
////            return CGSize(width: view.frame.width, height: 120)
////        }
//        return CGSize(width: 100.0, height: 100.0)
//    }

}





