//
//  HomeViewController.swift
//  SushiYasaka
//
//  Created by Justin Espejo on 2/25/16.
//  Copyright © 2016 QC.quack. All rights reserved.
//

import UIKit
import Foundation


class HomeViewController: UIViewController {

    @IBOutlet weak var Open: UIBarButtonItem!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        Open.target = self.revealViewController()
        Open.action = Selector("revealToggle:")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
