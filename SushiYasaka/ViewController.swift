//
//  ViewController.swift
//  SushiYasaka
//
//  Created by Justin Espejo on 2/25/16.
//  Copyright © 2016 QC.quack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var Open: UIBarButtonItem!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        Open.target = self.revealViewController()
        Open.action = Selector("revealToggle:")
        

    }
    
    



}

