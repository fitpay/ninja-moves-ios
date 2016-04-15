//
//  WebViewController.swift
//  ninjamoves
//
//  Copyright © 2016 Fitpay. All rights reserved.
//

import Foundation
import UIKit

class WebViewController: UIViewController {
    @IBOutlet weak var webview: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loading web view controller")
        
        self.webview.frame = self.view.bounds
        let url = NSURL (string: "http://demo-qa.pagare.me?disableCreateUserRestriction=true");
        let requestObject = NSURLRequest(URL: url!);
        webview.loadRequest(requestObject);
    }
    
}
