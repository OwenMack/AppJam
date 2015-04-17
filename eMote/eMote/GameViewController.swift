//
//  ViewController.swift
//  eMote
//
//  Created by owen mack on 4/16/15.
//  Copyright (c) 2015 Owen Mack. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    private var emotionClasses = [EmotionClass]()
    private var currentObject: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var animatedFace = [UIImage]()
        var realFace = [UIImage]()
        
        //declaring all of the emotion classes
        var happyClass = EmotionClass(newName: "Happy", newEnum: EmotionEnum.HAPPY, newIcon: UIImage(named: "TestImage1")!, newAnimatedFace: animatedFace, newrealFace: realFace)
        var sadClass = EmotionClass(newName: "Sad", newEnum: EmotionEnum.SAD, newIcon: UIImage(named: "TestImage1")!, newAnimatedFace: animatedFace, newrealFace: realFace)
        var angeryClass = EmotionClass(newName: "Angery", newEnum: EmotionEnum.ANGERY, newIcon: UIImage(named: "TestImage1")!, newAnimatedFace: animatedFace, newrealFace: realFace)
        var scaredClass = EmotionClass(newName: "Scared", newEnum: .SCARED, newIcon: UIImage(named: "TestImage1")!, newAnimatedFace: animatedFace, newrealFace: realFace)
        var disgustedClass = EmotionClass(newName: "Disgusted", newEnum: .DISGUSTED, newIcon: UIImage(named: "TestImage1")!, newAnimatedFace: animatedFace, newrealFace: realFace)
        var surprisedClass = EmotionClass(newName: "Surprised", newEnum: .SURPRISED, newIcon: UIImage(named: "TestImage1")!, newAnimatedFace: animatedFace, newrealFace: realFace)
        
        //adding all of the classes to the array
        emotionClasses.append(happyClass)
        emotionClasses.append(sadClass)
        emotionClasses.append(angeryClass)
        emotionClasses.append(scaredClass)
        emotionClasses.append(disgustedClass)
        emotionClasses.append(surprisedClass)
        
        
        imageButton.setTitle("", forState: .Normal)
        imageButton.adjustsImageWhenDisabled = false
        imageButton.setBackgroundImage(UIImage(named: "TestImage1"),forState: .Normal)
        
        button1.setTitle("One", forState: .Normal)
        button2.setTitle("Two", forState: .Normal)
        button3.setTitle("Three", forState: .Normal)
        button4.setTitle("Four", forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Button1Clicked(sender: AnyObject) {
        AnyButtonClicked(sender as! UIButton)
    }
    @IBAction func Button2Clicked(sender: AnyObject) {
        AnyButtonClicked(sender as! UIButton)
    }
    @IBAction func Button3Clicked(sender: AnyObject) {
        AnyButtonClicked(sender as! UIButton)
    }
    @IBAction func Button4Clicked(sender: AnyObject) {
        AnyButtonClicked(sender as! UIButton)
    }
    
    
    
    
    private func AnyButtonClicked(clicked: UIButton){
        
        var newCorrectButton = NewRandomButton()
        
        var randomButtons = GetRandomNumbers(4, max: 4, insertRandomly: newCorrectButton.randomNum)
        SetNewRandomButtons(randomButtons)
        
//        imageButton.setBackgroundImage(newCorrectButton.newImage, forState: .Normal)
    }
    
    private func NewRandomButton() -> (randomNum: Int, randomNumImageNum: Int, newName: String){//), newImage: UIImage) {
        var random = Int(arc4random_uniform(UInt32(emotionClasses.count)))
        var randomImageNum = Int(arc4random_uniform(UInt32(emotionClasses[random].GetRealFace().count)))
        var newName = emotionClasses[random].GetName()
        var newImage : UIImage!//= emotionClasses[random].GetRealFace()[randomImageNum]
        
        return (random,randomImageNum,newName)//,newImage)
    }
    
    private func SetNewRandomButtons(randomButtons: [Int]) {
        button1.setTitle(emotionClasses[randomButtons[0]].GetName(), forState: .Normal)
        button2.setTitle(emotionClasses[randomButtons[1]].GetName(), forState: .Normal)
        button3.setTitle(emotionClasses[randomButtons[2]].GetName(), forState: .Normal)
        button4.setTitle(emotionClasses[randomButtons[3]].GetName(), forState: .Normal)
    }
    
    
    //Will get random nums
    //amount - how many you want
    //max - the highest the number can be - will get ( 0 -> n-1)
    private func GetRandomNumbers(amount: Int,max: Int) -> [Int]{
        var nums = [Int]()
        var nextNum : Int
        var checkingNum = [Int]()
    
        for(var i = 0;i<amount;i++){
            nextNum = Int(arc4random_uniform(UInt32(max)))
            checkingNum = nums.filter({$0 == nextNum})

            while(checkingNum.count > 0){
                nextNum = Int(arc4random_uniform(UInt32(max)))
                checkingNum = nums.filter({$0 == nextNum})
            }

            nums.append(nextNum)
        }

        return nums
    }
    
    private func GetRandomNumbers(amount: Int,max: Int,insertRandomly: Int)->[Int]{
        var nums = [Int]()
        var nextNum : Int
        var checkingNum = [Int]()
        
        nums.append(insertRandomly)
        for(var i = 0;i<amount-1;i++){
            nextNum = Int(arc4random_uniform(UInt32(max)))
            checkingNum = nums.filter({$0 == nextNum})
            
            while(checkingNum.count > 0){
                nextNum = Int(arc4random_uniform(UInt32(max)))
                checkingNum = nums.filter({$0 == nextNum})
            }
            
            nums.append(nextNum)
        }
        nextNum = nums.removeAtIndex(0)
        
        nums.insert(nextNum, atIndex: Int(arc4random_uniform(UInt32(max))))
        
        return nums
    }

}

