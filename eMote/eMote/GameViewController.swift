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
    @IBOutlet weak var answerLabel: UILabel!
    
    private var emotionClasses = [EmotionClass]()
    private var currentObject: Int!
    private var winningAnswer: String!
    
    var blankImage: UIImage!
    
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
        answerLabel.text = ""
        
        
        SetInitalButtonLayout()
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
        if(clicked.currentTitle == winningAnswer){
            FadeInAnswer("Correct")
        }else{
            FadeInAnswer("Wrong")
        }
        var newCorrectButton = NewRandomButton()
        winningAnswer = newCorrectButton.newName
        var randomButtons = GetRandomNumbers(4, max: 4, insertRandomly: newCorrectButton.randomNum)
        SetNewRandomButtons(randomButtons)
        
        
        println("winningAnswer is - \(winningAnswer)")
//        imageButton.setBackgroundImage(newCorrectButton.newImage, forState: .Normal)
    }
    
    private func SetInitalButtonLayout(){
        var newCorrectButton = NewRandomButton()
        winningAnswer = newCorrectButton.newName
        var randomButtons = GetRandomNumbers(4, max: 4, insertRandomly: newCorrectButton.randomNum)
        SetNewRandomButtons(randomButtons)
        
        println("winningAnswer is - \(winningAnswer)")
        //        imageButton.setBackgroundImage(newCorrectButton.newImage, forState: .Normal)
    }
    
    //will get all the info for the new winning button
    private func NewRandomButton() -> (randomNum: Int, randomNumImageNum: Int, newName: String){//), newImage: UIImage) {
        var random = Int(arc4random_uniform(UInt32(emotionClasses.count)))
        var randomImageNum = Int(arc4random_uniform(UInt32(emotionClasses[random].GetRealFace().count)))
        var newName = emotionClasses[random].GetName()
        var newImage : UIImage!//= emotionClasses[random].GetRealFace()[randomImageNum]
        
        return (random,randomImageNum,newName)//,newImage)
    }
    
    private func SetNewRandomButtons(randomButtons: [Int]) {
        UIView.animateWithDuration(0.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.button1.alpha = 0.0
            self.button2.alpha = 0.0
            self.button3.alpha = 0.0
            self.button4.alpha = 0.0
            }, completion: {
                (finished: Bool) -> Void in
                
                self.button1.setTitle(self.emotionClasses[randomButtons[0]].GetName(), forState: .Normal)
                self.button2.setTitle(self.emotionClasses[randomButtons[1]].GetName(), forState: .Normal)
                self.button3.setTitle(self.emotionClasses[randomButtons[2]].GetName(), forState: .Normal)
                self.button4.setTitle(self.emotionClasses[randomButtons[3]].GetName(), forState: .Normal)
                
                UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                    self.button1.alpha = 1.0
                    self.button2.alpha = 1.0
                    self.button3.alpha = 1.0
                    self.button4.alpha = 1.0
                    }, completion: nil)
        })
    }

    

    
    //Will get random nums
    //amount - how many you want
    //max - the highest the number can be - will get ( 0 -> n-1)
    //insertRandomly - will insert this randomly into the new array, without duplicating it
    func GetRandomNumbers(amount: Int,max: Int,insertRandomly: Int)->[Int]{
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
    
    func FadeInAnswer(var theAnswer: String){
        UIView.animateWithDuration(0.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.answerLabel.alpha = 0.0
            }, completion: {
                (finished: Bool) -> Void in
                
                self.answerLabel.text = theAnswer
                
                UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                    self.answerLabel.alpha = 1.0
                    }, completion: nil)
            })
        }
    
//    func FadeOutAnswer(){
//        println("in the func")
//        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
//            self.answerLabel.alpha = 0.0
//            }, completion: {
//                (finished: Bool) -> Void in
//                
//                self.answerLabel.text = nil
//                
//                UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
//                    self.answerLabel.alpha = 0.0
//                    }, completion: nil)
//        })
//    }
    
    
    //Don't know if will need
//    private func GetRandomNumbers(amount: Int,max: Int) -> [Int]{
//        var nums = [Int]()
//        var nextNum : Int
//        var checkingNum = [Int]()
//        
//        for(var i = 0;i<amount;i++){
//            nextNum = Int(arc4random_uniform(UInt32(max)))
//            checkingNum = nums.filter({$0 == nextNum})
//            
//            while(checkingNum.count > 0){
//                nextNum = Int(arc4random_uniform(UInt32(max)))
//                checkingNum = nums.filter({$0 == nextNum})
//            }
//            
//            nums.append(nextNum)
//        }
//        
//        return nums
//    }
    

}

