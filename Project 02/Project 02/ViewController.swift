//
//  ViewController.swift
//  Project 02
//
//  Created by elric on 16/7/8.
//  Copyright © 2016年 kiwi. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var data = ["30 Days Swift", "你好世界", "学习Swift", "呵呵", "呵呵，再见🤗 See you next Project"]
    
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular"]
    
    var fontRowIndex = 0
    
    var changeFontButton: UIButton!
    var fontTableView: UITableView!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blackColor()
        
        fontTableView = UITableView()
        fontTableView.frame = CGRectMake(0, 50, 480, 200)
        fontTableView.dataSource = self
        fontTableView.delegate = self
        fontTableView.backgroundColor = UIColor.blackColor()
        fontTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        fontTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "FontCell")
        self.view.addSubview(fontTableView)
        fontTableView.snp_makeConstraints { (make) in
            make.height.equalTo(self.view).multipliedBy(0.6)
            make.center.width.equalTo(self.view)
        }
        
        changeFontButton = UIButton(type: .Custom)
        changeFontButton.layer.cornerRadius = 10
        changeFontButton.setTitle("Change", forState: .Normal)
        changeFontButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        changeFontButton.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(changeFontButton)
        changeFontButton.snp_makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.view).offset(-50)
        }
        changeFontButton.addTarget(self, action: #selector(changeFont), forControlEvents: .TouchDown)
        

        
        for family in UIFont.familyNames() {
            for font in UIFont.fontNamesForFamilyName(family){
                print(font)
            }
        }
        

        
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = fontTableView.dequeueReusableCellWithIdentifier("FontCell", forIndexPath: indexPath)
        
        let text = data[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.backgroundColor = UIColor.blackColor()
        cell.textLabel?.font = UIFont(name:self.fontNames[fontRowIndex], size:16)
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func changeFont() {
        fontRowIndex = (fontRowIndex + 1) % 3
        fontTableView.reloadData()
        print("\(self.fontNames[fontRowIndex])")
    }



}

