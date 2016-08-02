//
//  WebViewController.swift
//  SafariView
//
//  Created by JungHyesu on 2016. 1. 2..
//  Copyright © 2016년 Lucy. All rights reserved.
//

import UIKit
//델리게이트는 위임자
class WebViewController: UIViewController,UIWebViewDelegate,UITextFieldDelegate, UIScrollViewDelegate {

    // MARK:- Life Cycle
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var urlField: UITextField!
    
    var myBookmarkList:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(myBookmarkList)
        loadURL(myBookmarkList)
    }
    
    /* 마지막 URL을 저장해놓고 띄워줌
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        loadLastURL(setLastURL(webView.request?.URL))
    }*/
    
    
    
    //MARK:- Button Method
    @IBAction func clickBackButton(sender: AnyObject) {
        self.webView.goBack()
    }
    
    @IBAction func clickRefreshButton(sender: AnyObject) {
        self.webView.reload()
    }
    
    @IBAction func clickForwardButton(sender: AnyObject) {
        self.webView.goForward()
    }
    
    @IBAction func clickPlusButton(sender: AnyObject) {
    
        //다른 웹뷰를 추가하는 메소드 추가해보기
        
    }
    
    //MARK:- web View Delegate
    //구글 말고는 다른 페이지로 안넘어가게
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        //textfield에서 주소들이 보이게 된다
        if let loadingURL:NSURL = request.URL {
            self.urlField.text = loadingURL.absoluteString
        }
        
        if let host = request.URL?.host {
            print("\(host)")
            
            if host.containsString("google") || host.containsString("medium") || host.containsString("brunch") || host.containsString("facebook") {
                return true
            }
        }
        return false
    }
    //마지막으로 저장된 url을 가져오기
    func webViewDidFinishLoad(webView: UIWebView) {
        setLastURL(webView.request?.URL)
    }


    //MARK:- load URL
    func loadURL(urlString: String) {
        if let url = NSURL(string: urlString){
            let requset = NSURLRequest(URL: url)
            self.webView.loadRequest(requset)
        }
        
    }
    
    //MARK:- TextField Delegate
    //사용자가 엔터를 눌렀다 나는 뭘해야하니 델리게이트야?
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.text?.isEmpty == false {
            self.loadURL(textField.text!)
        }
        textField.endEditing(true)
        return true
    }
    
    
}
