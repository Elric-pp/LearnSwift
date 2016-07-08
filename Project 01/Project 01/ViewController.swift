//
//  ViewController.swift
//  Project 01
//
//  Created by elric on 16/7/8.
//  Copyright © 2016年 kiwi. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var displayView: UIView!
    var controlView: UIView!
    var timeLabel: UILabel!
    var resetButton: UIButton!
    var startButton: UIButton!
    var pauseButton: UIButton!
    
    var Counter = 0.0
    var Timer = NSTimer()
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayView = UIView()
        controlView = UIView()
        timeLabel = UILabel()
        resetButton = UIButton(type: .Custom)
        startButton = UIButton(type: .Custom)
        pauseButton = UIButton(type: .Custom)
        
        self.view.addSubview(displayView)
        self.view.addSubview(controlView)
        
        displayView.snp_makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.height.equalTo(self.view).multipliedBy(0.4)
            make.width.equalTo(self.view)
        }
        displayView.backgroundColor = UIColor.blackColor()

        
        controlView.snp_makeConstraints { (make) in
            make.top.equalTo(displayView.snp_bottom)
            make.width.equalTo(self.view)
            make.height.equalTo(self.view).multipliedBy(0.6)
        }
        controlView.backgroundColor = UIColor.blueColor()
        
        timeLabel.text = String(Counter)
        timeLabel.textColor = UIColor.whiteColor()
        timeLabel.font = UIFont(name: "HeiTi SC", size: 30)
        timeLabel.textAlignment = .Center
        displayView.addSubview(timeLabel)
        timeLabel.snp_makeConstraints { (make) in
            make.left.right.equalTo(displayView)
            make.centerY.equalTo(displayView.snp_centerY)
        }
        
        resetButton.setTitle("reset", forState: .Normal)
        resetButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        displayView.addSubview(resetButton)
        resetButton.snp_makeConstraints { (make) in
            make.right.equalTo(displayView).offset(-10)
            make.top.equalTo(displayView).offset(10)
        }
        resetButton.addTarget(self, action: #selector(resetButtonOnClick), forControlEvents: .TouchDown)
        
        startButton.backgroundColor = UIColor(red: 60/255, green: 152/255, blue: 249/255, alpha: 1)
        startButton.setTitle("start", forState: .Normal)
        startButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        controlView.addSubview(startButton)
        startButton.snp_makeConstraints { (make) in
            make.width.equalTo(controlView).multipliedBy(0.5)
            make.top.left.height.equalTo(controlView)
        }
        startButton.addTarget(self, action: #selector(startButtonOnClick), forControlEvents: .TouchDown)
        
        pauseButton.backgroundColor = UIColor(red: 28/255, green: 121/255, blue: 199/255, alpha: 1)
        pauseButton.setTitle("pause", forState: .Normal)
        pauseButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        controlView.addSubview(pauseButton)
        pauseButton.snp_makeConstraints { (make) in
            make.width.equalTo(controlView).multipliedBy(0.5)
            make.top.right.height.equalTo(controlView)
        }
        pauseButton.addTarget(self, action: #selector(pauseButtonOnClick), forControlEvents: .TouchDown)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetButtonOnClick() {
        startButton.enabled = true
        pauseButton.enabled = false
        Timer.invalidate()
        isPlaying = false
        Counter = 0.0
        timeLabel.text = String(Counter)
    }
    
    func startButtonOnClick() {
        if isPlaying {
            return
        }
        startButton.enabled = false
        pauseButton.enabled = true
        Timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    func pauseButtonOnClick() {
        if !isPlaying {
            return
        }
        startButton.enabled = true
        pauseButton.enabled = false
        Timer.invalidate()
        isPlaying = false
    }
    
    func UpdateTimer() {
        Counter = Counter + 0.1
        timeLabel.text = String(format: "%.1f", Counter)
    }


}

