//
//  ManageURL.swift
//  SafariView
//
//  Created by JungHyesu on 2016. 1. 2..
//  Copyright © 2016년 Lucy. All rights reserved.
//

import Foundation
/****************
 마지막 URL을 저장하기 위한 전역 함수들
 ***************/
let UserDefaultKeyLastURL: String = "lastURL"

func loadLastURL() -> NSURL {
    if let lastURL: NSURL = NSUserDefaults.standardUserDefaults().objectForKey("lastURL") as? NSURL{
        return lastURL
    }
    
    return basicURL()
}

func setLastURL(lastURL: NSURL?) {
    NSUserDefaults.standardUserDefaults().setURL(lastURL, forKey: UserDefaultKeyLastURL)
    NSUserDefaults.standardUserDefaults().synchronize()
}

func basicURL() -> NSURL {
    return NSURL(string: "https://www.google.com") ?? NSURL()
}
