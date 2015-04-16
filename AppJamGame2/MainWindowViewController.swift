//
//  MainWindowViewController.swift
//  AppJamGame2
//
//  Created by owen mack on 4/15/15.
//  Copyright (c) 2015 Owen Mack. All rights reserved.
//

import UIKit

class MainWindowViewController: UIViewController {

    @IBOutlet weak var segueButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "eMote"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println(segue.description,"\n")
        if segue.description == "MainToGame"{
            println("hello")
            if var destinationVC = segue.destinationViewController as? GameViewController{}
            // Pass the selected object to the new view controller.
        }
    }
//    else {
//    println("here")
//    }


}
