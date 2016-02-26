//
//  ReservationViewController.swift
//  SushiYasaka
//
//  Created by Justin Espejo on 2/26/16.
//  Copyright © 2016 QC.quack. All rights reserved.
//

import UIKit
import SafariServices

class ReservationViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var Item: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        Item.target = self.revealViewController()
        Item.action = Selector("revealToggle:")
//        let url = NSURL (string: "http://m.opentable.com/restaurants/sushi-yasaka/76567?rid=76567");
//          let url = NSURL (string: "google.com");
//        let requestObj = NSURLRequest(URL: url!);
//            webView.loadRequest(requestObj);
        showWebsite()
    }
    
    func showWebsite(){
        let url = NSURL (string: "http://m.opentable.com/restaurants/sushi-yasaka/76567?rid=76567");
        let webVC = SFSafariViewController(URL: url!)
        
        presentViewController(webVC, animated: true, completion: nil)
    
    }
    
    }


