//
//  ViewController.swift
//  ninjamoves
//
//  Created by Benjamin Walford on 4/15/16.
//  Copyright © 2016 Fitpay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var webview: UIWebView!
    
    @IBAction func Clicky(sender: AnyObject) {
        print("Opening web view")
        
        let url = NSURL (string: "http://demo-qa.pagare.me");
        let requestObject = NSURLRequest(URL: url!);
        webview.loadRequest(requestObject);
        
        self.webview.frame = self.view.bounds
        webview.hidden = false;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Starting ninja moves application")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

