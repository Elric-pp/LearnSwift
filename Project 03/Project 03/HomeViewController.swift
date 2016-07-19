//
//  HomeViewController.swift
//  Project 03
//
//  Created by elric on 16/7/13.
//  Copyright © 2016年 kiwi. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate  {
    var backgroundImageView: UIImageView!
    var collectionView: UICollectionView!
    
    var currentUserProfileImageButton: UIButton!
    var currentUserFullNameButton: UIButton!
    
    private var interests = Interest.createInterests()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        flowLayout.minimumLineSpacing = 20
        flowLayout.minimumInteritemSpacing = 20
        flowLayout.sectionInset = UIEdgeInsets(top: 50, left: 20, bottom: 10, right: 0)
        flowLayout.itemSize = CGSize(width: 200, height: 400)
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.registerClass(InterestCollectionViewCell.self, forCellWithReuseIdentifier: "InterestCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clearColor()
        
        self.view.addSubview(collectionView)
        collectionView.snp_makeConstraints { (make) in
            make.width.equalTo(self.view)
            make.height.equalTo(500)
            make.top.equalTo(self.view).offset(20)
        }
        
//        self.view.addSubview(backgroundImageView)
//        self.view.addSubview(currentUserProfileImageButton)
//        self.view.addSubview(currentUserFullNameButton)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("InterestCell", forIndexPath: indexPath) as! InterestCollectionViewCell

        cell.interest = self.interests[indexPath.item]
        return cell
    }
}

