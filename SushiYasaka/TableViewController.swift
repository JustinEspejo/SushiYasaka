//
//  TableViewController.swift
//  SushiYasaka
//
//  Created by Justin Espejo on 2/25/16.
//  Copyright © 2016 QC.quack. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    var TableArray = [String]();
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        TableArray = ["Home", "Menu", "Reservation", "Directions"]
//        let frame = CGRectMake(0, 0, self.view.frame.size.width-50, 50)
//        let headerImageView = UIImageView(frame: frame)
        let image: UIImage = UIImage(named: "background2")!
        
//        headerImageView.image = image
//        tableView.tableHeaderView = headerImageView
        let imageView = UIImageView(image: image)

        tableView.backgroundView = imageView
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.alpha = 0.4
        blurView.frame = imageView.bounds
        imageView.addSubview(blurView)

    }
}

    // MARK: - Table view data source
    
    extension TableViewController : UITableViewDataSource{

     func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TableArray.count
    }

        func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
            cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
        }
        
        
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableArray[indexPath.row], forIndexPath: indexPath)
        
        cell.textLabel!.text = TableArray[indexPath.row]
        
        return cell
    }
}

extension TableViewController : UITableViewDelegate{


}

//    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let myCustomView: UIImageView
//        myCustomView.image = myImage
//        
//        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
//        header.addSubview(myCustomView)
//        return header
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


