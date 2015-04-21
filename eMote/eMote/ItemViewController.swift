//
//  ItemViewController.swift
//  eMote
//
//  Created by John C Van Hoogenstyn on 4/19/15.
//  Copyright (c) 2015 Owen Mack. All rights reserved.
//

import UIKit
import CoreData





class ItemViewController: UIViewController {

    @IBOutlet weak var textViewItem: UITextView!
   // var emotionChoice: String
    
   
    @IBAction func angryButton(sender: AnyObject)
    {
    
   //     emotionChoice == "Angry"
    
    }
    
    @IBAction func sadButton(sender: AnyObject)
    {
    
       
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    @IBAction func cancelButton(sender: AnyObject)
    {
    
        self.navigationController?.popToRootViewControllerAnimated(true)
    
    }
    @IBAction func saveButton(sender: AnyObject)
    {
        // Refernce to app delegate
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // refernce model
        
        let context: NSManagedObjectContext = appDel.managedObjectContext!
       
        let listEntity = NSEntityDescription.entityForName("List", inManagedObjectContext: context)
        
        // Create instance of our data model and initiailze
        
        var newItem = NSModel(entity: listEntity!, insertIntoManagedObjectContext: context)
        
        // Map our properties
        
        
        
        newItem.note = textViewItem.text
        //newItem.emotion = emotionChoice
        
        
        
        
        // Save our context
        
        context.save(nil)
        
    
        
        // navigatve back to rootVC
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
        
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
