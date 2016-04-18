//
//  WebViewController.swift
//  ninjamoves
//
//  Copyright © 2016 Fitpay. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController {
  
    @IBOutlet var containerView : UIView! = nil
    var webView: WKWebView?
    
    override func loadView() {
        super.loadView()
        
        self.webView = WKWebView()
        self.view = self.webView!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // base64url encoded payment device data
        // let config = "?config=eyJwYXltZW50RGV2aWNlIjogeyAiZGV2aWNlVHlwZSI6ICJXQVRDSCIsICJtYW51ZmFjdHVyZXJOYW1lIjogIkZvbyIsICJkZXZpY2VOYW1lIjogIkJhciIsICJmaXJtd2FyZVJldmlzaW9uIjogWyAiMSIsICIwIiwgIjAiIF0sICJvc05hbWUiOiAiQW5kcm9pZCJ9LCAiY2hhbm5lbE5hbWUiOiAiMTIzNDUifQ"

        let url = "http://demo-qa.pagare.me"
        
        let requestUrl = NSURL(string: url)
        let request = NSURLRequest(URL:requestUrl!)
        self.webView!.loadRequest(request)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
