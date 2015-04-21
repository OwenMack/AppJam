//
//  ListTableViewController.swift
//  eMote
//
//  Created by John C Van Hoogenstyn on 4/19/15.
//  Copyright (c) 2015 Owen Mack. All rights reserved.
//

import UIKit
import CoreData


class ListTableViewController: UITableViewController {

    
    var myList: Array<AnyObject> = []
    //var myEmotions: Array<AnyObject> = []
    


 
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(animated: Bool)
    {
       

        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext!
      //  let context2: NSManagedObjectContext = appDel.managedObjectContext!
        
        let freq = NSFetchRequest(entityName: "List")
        //let freq2 = NSFetchRequest(entityName: "Emotions")
        
        myList = context.executeFetchRequest(freq, error: nil)!
       // myEmotions = context2.executeFetchRequest(freq2, error: nil)!
       
        
        
        /*
        if myList.count == 0
        {
            myList[0] = "Hello"
        }
        */
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return myList.count
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
      
        // Configure the cell...
        
        let CellID: NSString = "Cell"
        
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellID as String) as! UITableViewCell
        
        if let ip = indexPath as NSIndexPath?
        {
            var data: NSManagedObject = myList[ip.row] as! NSManagedObject
            cell.textLabel?.text = (data.valueForKeyPath("note") as! String)
            
           
           
        }
        
        return cell
    }
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
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
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

        ///In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) 
    {
        
       
        
    }


}
