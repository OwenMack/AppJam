//
//  SelectRealOrAnimatedViewController.swift
//  eMote
//
//  Created by owen mack on 4/22/15.
//  Copyright (c) 2015 Owen Mack. All rights reserved.
//

import UIKit

class SelectRealOrAnimatedViewController: UIViewController {
    @IBOutlet weak var animatedButton: UIButton!
    @IBOutlet weak var realButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destinationVC = segue.destinationViewController as! GameViewController
        if(segue.identifier == "AnimatedSegue") {
            destinationVC.SetDoingRealFaces(false)
        }else if(segue.identifier == "RealSegue") {
            destinationVC.SetDoingRealFaces(true)
        }
        
        
        
    }

}
