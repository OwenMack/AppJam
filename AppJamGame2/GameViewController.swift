//
//  GameViewController.swift
//  AppJamGame2
//
//  Created by owen mack on 4/15/15.
//  Copyright (c) 2015 Owen Mack. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    private var emotionClasses: [EmotionClass]!
    private var currentObject: Int!
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        println("hello")
        // Do any additional setup after loading the view.
        imageButton.setTitle("", forState: .Normal)
        imageButton.adjustsImageWhenDisabled = false
        imageButton.setBackgroundImage(UIImage(named: "TestImage"), forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func AnyButtonPressed(var pressed: UIButton){
//        var correct: Bool = false
//        if emotionClasses[currentObject].GetName() == pressed.currentTitle!{
//            correct = true
//        }
//        
//        if (correct)
//        {
//            println("good job");
//            
//        }
//        else
//        {
//            println("fuck you")
//        }
//    }
//    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
