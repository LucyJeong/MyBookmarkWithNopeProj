//
//  ViewController.swift
//  SafariView
//
//  Created by JungHyesu on 2016. 1. 2..
//  Copyright © 2016년 Lucy. All rights reserved.
//

import UIKit
//import SafariServices
//,SFSafariViewControllerDelegate 상속을 받으면 사파리뷰를 사용할 수 있음
class ViewController: UIViewController  {
    
    @IBOutlet var showWebBrowser: UIButton!
    /*
    @IBAction func clickedShowWebBrowserButton() {

        //런타임중에 체크하는 방법
//        if #available(iOS 9.0, *) {
//            print("is iOS 9 and elder")
//            
//            if let url:NSURL = NSURL(string: "https://www.google.com"){
//            let safariBrowser: SFSafariViewController = SFSafariViewController(URL: url)
//                safariBrowser.delegate = self
//            self.navigationController?.pushViewController(safariBrowser, animated: true)
//            
//            }
//        } else {
           self.performSegueWithIdentifier("ShowWebView", sender: self)
        
        
    }*/

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /*
    @available(iOS 9.0, *)
    func safariViewController(controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        print("did load successfully")
    }
    //모달로 띄웠을때 던버튼을 누르면 뜨는 메소드
    @available(iOS 9.0, *)
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        print("did finish")
    }
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let destinationVC = segue.destinationViewController as? WebViewController {
        
            if segue.identifier == "ShowBrunch" {
                print("브런치")
                destinationVC.myBookmarkList = "https://brunch.co.kr/magazine/nomadslife"
                
            }else if segue.identifier == "ShowMedium" {
                    destinationVC.myBookmarkList = "https://medium.com/@hyesoojung"
                print("미디엄")
                
            }else if segue.identifier == "ShowWAD" {

                destinationVC.myBookmarkList = "https://www.facebook.com/groups/1722427378043847/"
                print("우디노")
            }
            
        }
    }

}

