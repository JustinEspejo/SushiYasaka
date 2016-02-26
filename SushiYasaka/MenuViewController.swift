//
//  ViewController.swift
//  SushiYasaka
//
//  Created by Justin Espejo on 2/25/16.
//  Copyright © 2016 QC.quack. All rights reserved.
//

import UIKit
import Foundation
import SafariServices

class MenuViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var Item: UIBarButtonItem!
    
    var seg1 = [[String]]()
    var appetizer = [String]()
    var soup = [String]()
    var salad = [String]()
    var noodles = [String]()
    var tempura1 = [String]()
    var tempura2 = [String]()
    var rolls = [String]()
    var sushi1 = [String]()
    var sushi2 = [String]()
    var maki = [String]()
    var steak = [String]()


    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.automaticallyAdjustsScrollViewInsets = false;
        Item.target = self.revealViewController()
        Item.action = Selector("revealToggle:")
        
        fillArray()
        


    }
    
    
    @IBAction func orderOnlineButtonPressed(sender: AnyObject)
    {
        let url = NSURL (string: "https://www.seamless.com/menu/sushi-yasaka-251-w-72nd-st-new-york/262416");
        let webVC = SFSafariViewController(URL: url!)
        presentViewController(webVC, animated: true, completion: nil)
    }
    
    @IBAction func segmentedControlButtonPressed(sender: AnyObject)
    {
    tableView.reloadData()
    }
    
    func fillArray()
    {
        
        appetizer = ["Edamame","Sauteed Organic Mushrooms","Sakura Shumai","Yokohama Gyoza","Vegetable Gyoza","Kaki Fry","Agedashi Tofu","Tatsuta Age","Beef Negimaki" ,"Gindara Kasuzuke","Ebi Shinjo","Hijik","Kinpira","Ohitashi","Goma Ae","Tuna Avocado","Toro Tartare","Ankimo","Usuzukuri","Sashimi"]
        
        salad = ["Small Salad","Yasaka Salad","Seaweed Salad","Garden Salad","Yaki-Shabu Salad","Grilled Shrimp & Avocado"]
    
        soup = ["Miso","Clear","Akadashi Miso"]
        
        noodles = ["Kanto Soba", "Kansai Udon", "Ebi Tempura Soba", "Vegie Tempura Soba", "Ebi Tempura Udon", "Vegi Tempura Udon"]
        
        tempura1 = ["Chef 's Omakase Vegetable Tempura", "Appetizer Tempura", "Appetizer Vegetable Tempura", "Dinner Tempura"]
        
        tempura2 = ["Lobster Tail", "Shrimp", "Asparagus", "Japanese Egg Plant", "Japanese Sweet Potato", "Kobocha Squash", "Maittake Mushroom", "Lotus Root", "Baby Onoin", "Baby Carrot", "Shishito Pepper", "Baby Zucchini", "Broccoli"]
        
        rolls = ["Negi Toro", "Negi Yellow Tail", "Tuna", "Tuna Avocado", "Tuna Cucumber","Spicy Salmon","Spicy Yellow Tail","Spicy Scallop","California","Fresh Salmon Salmon Avocado","Salmon Cucumber","Salmon Skin","Salmon Roe","Fluke Ume Shiso","Eel Cucumber","Eel Avocado","Ume Shiso Cucumber Shitake Mushroom","Oshinko","Avocado","Asparagus","Cooked Kampyo","Cucumber","Sweet Potato Tempura","Pumpkin Tempura","Shrimp Tempura","Spicy Ebi Tempura"]
        
        sushi1 = ["Yasaka Chef Recommemd","Sushi Deluxe","Sashimi Deluxe","Miyabi","Umi No Sachi","Yaki Salmon Donburi","Spicy Maki Combination"]
        
        sushi2 = ["Fatty Tuna","Tuna","Yellow Tail","Fresh Salmon","King Salmon","Fluke","King Crab","Octopus","Squid","Fried Oyster","Smelt Roe","Sea Urchin (Maine)","Sea Urchin Cali","Sea Bass","Japanese Snapper","Shime Mackerel","Spanish Mackerel","Eel","Sea Eel","Crab Stick","Boiled Shrimp","Botan Shrimp Salmon Roe","Live Scallop","Baby Abalone"]
        
        maki = ["Fried Japanese Oyster", "Mix Vegetable","Futomaki","Lobster Tempura Roll","Geisha Roll","Soft Shell Crab","Boston Real Crab Roll", "Chopped Crunch Eel Avocado"]
        
        steak = ["Organic Chicken Teriyaki", "King Salmon Teriyaki", "Tofu Steak", "Angus Prime Rib Eye Steak"]
    }
    
    
    
}

extension MenuViewController : UITableViewDataSource
{

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        var sectionValue = 0
        
        switch (segmentedControl.selectedSegmentIndex)
        {
            
        case 0:
            sectionValue = 3
            break
            
        case 1:
            sectionValue = 3
            break;
            
        case 2:
            sectionValue = 3
            break;
        
        case 3:
            sectionValue = 2
            break;
        
        default:
        break;
        }
        return sectionValue
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (segmentedControl.selectedSegmentIndex)
        {
            
        case 0:
            if(section == 0)
            {
            return appetizer.count
            }
            else if (section == 1)
            {
            return soup.count
            }
            else
            {
            return salad.count
            }
            
            
        case 1:
            if(section == 0)
            {
                return noodles.count
            }
            else if (section == 1)
            {
                return tempura1.count
            }
            else
            {
                return tempura2.count
            }
            
            
        case 2:
            if(section == 0)
            {
                return rolls.count
            }
            else if (section == 1)
            {
                return sushi1.count
            }
            else
            {
                return sushi2.count
            }
            
            
        case 3:
            if(section == 0)
            {
                return maki.count
            }
            else
            {
                return steak.count
            }
            
        default:
            return 0;
        }
    
    }
    
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("cell1", forIndexPath: indexPath)
            
            switch (segmentedControl.selectedSegmentIndex)
            {
                
            case 0:
                if(indexPath.section==0){
                cell.textLabel!.text = appetizer[indexPath.row]
                }else if(indexPath.section==0){
                cell.textLabel!.text = soup[indexPath.row]
                }else{
                cell.textLabel!.text = salad[indexPath.row]
                }
                break
                
            case 1:
                if(indexPath.section==0){
                    cell.textLabel!.text = noodles[indexPath.row]
                }else if(indexPath.section==0){
                    cell.textLabel!.text = tempura1[indexPath.row]
                }else{
                    cell.textLabel!.text = tempura2[indexPath.row]
                }
                break
                
            case 2:
                if(indexPath.section==0){
                    cell.textLabel!.text = rolls[indexPath.row]
                }else if(indexPath.section==0){
                    cell.textLabel!.text = sushi1[indexPath.row]
                }else{
                    cell.textLabel!.text = sushi2[indexPath.row]
                }
                break
            case 3:
                if(indexPath.section==0){
                    cell.textLabel!.text = maki[indexPath.row]
                }else{
                    cell.textLabel!.text = steak[indexPath.row]
                }
                break
                
            default:
                break;
            }
//            cell.textLabel!.text = TableArray[indexPath.row]
            
            
            return cell
    }
    
        func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            var arrayReturn = [String]()
    
            switch (segmentedControl.selectedSegmentIndex)
            {
            case 0:
                arrayReturn = ["Appetizer","Soup","Salad"]
                break
    
            case 1:
                arrayReturn = ["Noodles","Tempura","Tempura A La Carte"]
                break;
    
            case 2:
                arrayReturn = ["Maki Rolls and Hand Rolls","Sushi Entrees","Sushi and Sashimi A La Carte"]
                break;
    
            case 3:
                arrayReturn = ["Yasaka's Signature Maki","Teriyaki & Steak"]
                break;
    
            default:
                break;
            }
    
            
                return arrayReturn[section]
    
        }
    
}
    


