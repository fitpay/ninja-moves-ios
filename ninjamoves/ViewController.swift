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
        print("Going to webview view");
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

