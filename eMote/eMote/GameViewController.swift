//
//  ViewController.swift
//  eMote
//
//  Created by owen mack on 4/16/15.
//  Copyright (c) 2015 Owen Mack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    private var emotionClasses: [EmotionClass]!
    private var currentObject: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageButton.setTitle("", forState: .Normal)
        imageButton.adjustsImageWhenDisabled = false
        imageButton.setBackgroundImage(UIImage(named: "TestImage1"), forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

