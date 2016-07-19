//
//  Interest.swift
//  Project 03
//
//  Created by elric on 16/7/13.
//  Copyright © 2016年 kiwi. All rights reserved.
//

import UIKit

class Interest {
    var title = ""
    var description = ""
    var numberOfMembers = 0
    var numberOfPosts = 0
    var featuredImage: UIImage!
    
    init(title: String, description: String, featuredImage: UIImage!) {
        self.title = title
        self.description = description
        self.featuredImage = featuredImage
        numberOfMembers = 1
        numberOfPosts = 1
    }
    
    static func createInterests() -> [Interest] {
        return [
            Interest(title: "hello", description: "we love swift 1", featuredImage: UIImage(named: "1")),
            Interest(title: "hello", description: "we love swift 2", featuredImage: UIImage(named: "2")),
            Interest(title: "hello", description: "we love swift 3", featuredImage: UIImage(named: "3")),
            Interest(title: "hello", description: "we love swift 4", featuredImage: UIImage(named: "4")),
            Interest(title: "hello", description: "we love swift 5", featuredImage: UIImage(named: "5")),
            Interest(title: "hello", description: "we love swift 6", featuredImage: UIImage(named: "6"))
        ]
    }
}
