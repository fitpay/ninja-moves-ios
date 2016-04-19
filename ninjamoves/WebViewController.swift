//
//  WebViewController.swift
//  ninjamoves
//
//  Copyright © 2016 Fitpay. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController, WKScriptMessageHandler {
    @IBOutlet weak var exitWebView: UIButton!
  
    @IBOutlet var containerView : UIView! = nil
    var webView: WKWebView?
    
    override func viewDidLoad() {
        print("loading web view")
        super.viewDidLoad()

        // let url = "http://demo-qa.pagare.me"
        // let url = "http://localhost:8083"
        
        // configure web-view
        let config:WKWebViewConfiguration = WKWebViewConfiguration()
        config.userContentController.addScriptMessageHandler(self, name: "interOp")
        self.webView = WKWebView(frame: self.view.frame, configuration: config)
        self.view = self.webView!
        self.view.addSubview(exitWebView)
        setExitButton()
        
        // optionally inject our own JS to be executed on page load
        let src = "document.body.style.background = 'orange'"
        let script = WKUserScript(source: src, injectionTime: .AtDocumentEnd, forMainFrameOnly: true)
        config.userContentController.addUserScript(script)
        
        // load web-view with request to external site
        // let requestUrl = NSURL(string: url)
        // let request = NSURLRequest(URL:requestUrl!)
        // self.webView!.loadRequest(request)
        
        // OR load web-view from local source
        let urlpath = NSBundle.mainBundle().pathForResource("webpage", ofType: "html")
        let localUrl:NSURL = NSURL.fileURLWithPath(urlpath!)
        self.webView!.loadFileURL(localUrl, allowingReadAccessToURL: localUrl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
        print("recieved message from web-view")
    
        // extract message from web-view
        let sentData = message.body as! NSDictionary
        let count:Int = Int(sentData["count"] as! NSNumber)
        
        // send message back to web-vew to call increment function
        webView!.evaluateJavaScript("increment(\(count + 1))", completionHandler: nil)
    }
    
    func setExitButton() {
        
        let leadingConstraint =
        NSLayoutConstraint(item: self.view,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.exitWebView,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1,
            constant: 0)
        
        let trailingConstraint =
        NSLayoutConstraint(item: self.view,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.exitWebView,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1,
            constant: 0)
        
        let bottomConstraint =
        NSLayoutConstraint(item: self.view,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.exitWebView,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 0)
        
        self.view.addConstraint(leadingConstraint)
        self.view.addConstraint(trailingConstraint)
        self.view.addConstraint(bottomConstraint)
    }
    
}
