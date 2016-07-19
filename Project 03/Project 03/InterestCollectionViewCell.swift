//
//  InterestCollectionViewCell.swift
//  Project 03
//
//  Created by elric on 16/7/13.
//  Copyright © 2016年 kiwi. All rights reserved.
//

import UIKit
import SnapKit

class InterestCollectionViewCell: UICollectionViewCell {
    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    
    var interestTitleLabel: UILabel!
    var featuredImageView: UIImageView!
    
    override init(frame: CGRect) {
        featuredImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height-100))
        interestTitleLabel = UILabel(frame: CGRect(x: 0, y: featuredImageView.frame.size.height, width: 200, height: frame.size.height/3))
        super.init(frame: frame)
        
        featuredImageView.contentMode = UIViewContentMode.ScaleAspectFit
        self.addSubview(featuredImageView)
        
        
        interestTitleLabel.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        interestTitleLabel.textAlignment = .Center
        interestTitleLabel.textColor = UIColor.whiteColor()
        self.addSubview(interestTitleLabel)
        
     }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateUI() {
        interestTitleLabel?.text = interest.title
        featuredImageView?.image = interest.featuredImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
}
