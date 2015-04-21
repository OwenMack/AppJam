//
//  ViewController.swift
//  eMote
//
//  Created by owen mack on 4/16/15.
//  Copyright (c) 2015 Owen Mack. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var emotionImage: UIImageView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    
    
    private var emotionClasses = [EmotionClass]()
    private var currentObject: Int!
    private var winningAnswer: String!
    private var blankImage: UIImage!
    private var DoingRealFaces: Bool!
    private var winningButtonNum: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emotionClasses = SetTheEmotionObjects()
        answerLabel.text = " "
        button5.setTitle("", forState: .Normal)
        
        SetInitalButtonLayout()
    }
    
    func SetDoingRealFaces(newBool: Bool) {
        DoingRealFaces = newBool
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
    @IBAction func Button5Clicked(sender: UIButton) {
        ContinueClicked(sender)
    }
    
    
    func AnyButtonClicked(clicked: UIButton){
        if(clicked.currentTitle == winningAnswer){
            FadeInAnswer("Correct")
        }else{
            FadeInAnswer("Wrong")
        }
        
        button1.enabled = false
        button2.enabled = false
        button3.enabled = false
        button4.enabled = false
        button5.enabled = true
        ClearAllButCorrectAnswer(winningButtonNum)
    }
    
    func ContinueClicked(clicked: UIButton){
        FadeInAnswer(" ")
        var newCorrectButton = NewRandomButton()
        winningAnswer = newCorrectButton.newName
        var randomButtons = GetRandomNumbers(4, max: 4, insertRandomly: newCorrectButton.randomNum)
        
        button1.enabled = true
        button2.enabled = true
        button3.enabled = true
        button4.enabled = true
        button5.enabled = false
        SetNewRandomButtons(randomButtons.0)
        winningButtonNum = randomButtons.1
        emotionImage.image = ResizeImage(newCorrectButton.newImage, targetSize: CGSize(width: 120, height: 120))
    }
    
    
    
    func SetInitalButtonLayout(){
        var newCorrectButton = NewRandomButton()
        winningAnswer = newCorrectButton.newName
        var randomButtons = GetRandomNumbers(4, max: 4, insertRandomly: newCorrectButton.randomNum)
        
        button5.enabled = false
        SetNewRandomButtons(randomButtons.0)
        winningButtonNum = randomButtons.1
        emotionImage.image = ResizeImage(newCorrectButton.newImage, targetSize: CGSize(width: 120, height: 120))
    }
    
    //will get all the info for the new winning button
    func NewRandomButton() -> (randomNum: Int, randomNumImageNum: Int, newName: String, newImage: UIImage) {
        var random = Int(arc4random_uniform(UInt32(emotionClasses.count)))
        var randomImageNum = 0
        var newImage : UIImage!
        if(DoingRealFaces == true){
            randomImageNum = Int(arc4random_uniform(UInt32(emotionClasses[random].GetRealFace().count)))
            newImage = emotionClasses[random].GetRealFace()[randomImageNum]
        }else{
            randomImageNum = Int(arc4random_uniform(UInt32(emotionClasses[random].GetAnimatedFace().count)))
            newImage = emotionClasses[random].GetAnimatedFace()[randomImageNum]
        }
        var newName = emotionClasses[random].GetName()
        
        return (random,randomImageNum,newName,newImage)
    }
    
    func SetNewRandomButtons(randomButtons: [Int]) {
        UIView.animateWithDuration(0.2, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.button1.alpha = 0.0
            self.button2.alpha = 0.0
            self.button3.alpha = 0.0
            self.button4.alpha = 0.0
            }, completion: {
                (finished: Bool) -> Void in
                
                self.button1.setTitle(self.emotionClasses[randomButtons[0]].GetName(), forState: .Normal)
                self.button1.setBackgroundImage(self.ResizeImage(UIImage(named: "GameButtonImage")!, targetSize: CGSize(width: 140, height: 80)), forState: .Normal)
                self.button1.setTitleColor(self.emotionClasses[randomButtons[0]].GetButtonColor(), forState: .Normal)
                
                self.button2.setTitle(self.emotionClasses[randomButtons[1]].GetName(), forState: .Normal)
                self.button2.setBackgroundImage(self.ResizeImage(UIImage(named: "GameButtonImage")!, targetSize: CGSize(width: 140, height: 80)), forState: .Normal)
                self.button2.setTitleColor(self.emotionClasses[randomButtons[1]].GetButtonColor(), forState: .Normal)

                
                self.button3.setTitle(self.emotionClasses[randomButtons[2]].GetName(), forState: .Normal)
                self.button3.setBackgroundImage(self.ResizeImage(UIImage(named: "GameButtonImage")!, targetSize: CGSize(width: 140, height: 80)), forState: .Normal)
                self.button3.setTitleColor(self.emotionClasses[randomButtons[2]].GetButtonColor(), forState: .Normal)

                
                self.button4.setTitle(self.emotionClasses[randomButtons[3]].GetName(), forState: .Normal)
                self.button4.setBackgroundImage(self.ResizeImage(UIImage(named: "GameButtonImage")!, targetSize: CGSize(width: 140, height: 100)), forState: .Normal)
                self.button4.setTitleColor(self.emotionClasses[randomButtons[3]].GetButtonColor(), forState: .Normal)
                
                self.button5.setTitle(" ", forState: .Normal)
                self.button5.setBackgroundImage(self.blankImage, forState: .Normal)

                UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                    self.button1.alpha = 1.0
                    self.button2.alpha = 1.0
                    self.button3.alpha = 1.0
                    self.button4.alpha = 1.0
                    }, completion: nil)
        })
    }
    
    
    func ClearAllButCorrectAnswer(var winningNum: Int) {
        UIView.animateWithDuration(0.2, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.button1.alpha = 0.0
            self.button2.alpha = 0.0
            self.button3.alpha = 0.0
            self.button4.alpha = 0.0
            }, completion: {
                (finished: Bool) -> Void in
                

                
                switch (winningNum + 1) {
                    case 1:self.button2.setTitle(" ", forState: .Normal)
                           self.button2.setBackgroundImage(self.blankImage, forState: .Normal)
                           self.button3.setTitle(" ", forState: .Normal)
                           self.button3.setBackgroundImage(self.blankImage, forState: .Normal)
                           self.button4.setTitle(" ", forState: .Normal)
                           self.button4.setBackgroundImage(self.blankImage, forState: .Normal)
                    break;
                    case 2:self.button1.setTitle(" ", forState: .Normal)
                           self.button1.setBackgroundImage(self.blankImage, forState: .Normal)
                           self.button3.setTitle(" ", forState: .Normal)
                           self.button3.setBackgroundImage(self.blankImage, forState: .Normal)
                           self.button4.setTitle(" ", forState: .Normal)
                           self.button4.setBackgroundImage(self.blankImage, forState: .Normal)
                    break;
                    case 3:self.button1.setTitle(" ", forState: .Normal)
                           self.button1.setBackgroundImage(self.blankImage, forState: .Normal)
                           self.button2.setTitle(" ", forState: .Normal)
                           self.button2.setBackgroundImage(self.blankImage, forState: .Normal)
                           self.button4.setTitle(" ", forState: .Normal)
                           self.button4.setBackgroundImage(self.blankImage, forState: .Normal)
                    break;
                    case 4:self.button1.setTitle(" ", forState: .Normal)
                           self.button1.setBackgroundImage(self.blankImage, forState: .Normal)
                           self.button2.setTitle(" ", forState: .Normal)
                           self.button2.setBackgroundImage(self.blankImage, forState: .Normal)
                           self.button3.setTitle(" ", forState: .Normal)
                           self.button3.setBackgroundImage(self.blankImage, forState: .Normal)
                    break;
                    default:println("Error - Switch in ClearAllButCorrectAnswer()")
                    break;
                }
                
                self.button5.setTitle("Continue", forState: .Normal)
                self.button5.setBackgroundImage(self.ResizeImage(UIImage(named: "GameButtonImage")!, targetSize: CGSize(width: 140, height: 80)), forState: .Normal)
                
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
    func GetRandomNumbers(amount: Int,max: Int,insertRandomly: Int)->([Int], Int){
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
        var insertAt = Int(arc4random_uniform(UInt32(max)))
        
        nums.insert(nextNum, atIndex: insertAt)
        
        return (nums,insertAt)
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
    
    func ResizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSizeMake(size.width * heightRatio, size.height * heightRatio)
        } else {
            newSize = CGSizeMake(size.width * widthRatio,  size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRectMake(0, 0, newSize.width, newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.drawInRect(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func SetTheEmotionObjects()->[EmotionClass]{
        var theClasses = [EmotionClass]()
        
        let numberOfAnimatedHappyFaces = 1
        let numberOfAnimatedSadFaces = 1
        let numberOfAnimatedAngeryFaces = 1
        let numberOfAnimatedScaredFaces = 1
        let numberOfAnimatedDisgustFaces = 1
        let numberOfAnimatedSurprisedFaces = 1
        
        var animatedHappyFaces     = [UIImage]()
        var animatedSadFaces       = [UIImage]()
        var animatedAngeryFaces    = [UIImage]()
        var animatedScaredFaces    = [UIImage]()
        var animatedDistedFaces    = [UIImage]()
        var animatedSurprisedFaces = [UIImage]()
        
        for (var i = 1; i <= numberOfAnimatedHappyFaces; i++) {
            animatedHappyFaces.append(UIImage(named: "AnimatedHappy\(i)")!)
        }
        for (var i = 1; i <= numberOfAnimatedSadFaces; i++) {
            animatedSadFaces.append(UIImage(named: "AnimatedSad\(i)")!)
        }
        for (var i = 1; i <= numberOfAnimatedAngeryFaces; i++) {
            animatedAngeryFaces.append(UIImage(named: "AnimatedAngry\(i)")!)
        }
        for (var i = 1; i <= numberOfAnimatedScaredFaces; i++) {
            animatedScaredFaces.append(UIImage(named: "AnimatedScared\(i)")!)
        }
        for (var i = 1; i <= numberOfAnimatedDisgustFaces; i++) {
            animatedDistedFaces.append(UIImage(named: "AnimatedDisgust\(i)")!)
        }
        for (var i = 1; i <= numberOfAnimatedSurprisedFaces; i++ ) {
            animatedSurprisedFaces.append(UIImage(named: "AnimatedSurprised\(i)")!)
        }
        
        var realHappyFaces = [UIImage]()
        var realSadFaces = [UIImage]()
        var realAngeryFaces = [UIImage]()
        var realScaredFaces = [UIImage]()
        var realDistedFaces = [UIImage]()
        var realSurprisedFaces = [UIImage]()
        
        let numberOfRealHappyFaces = 2
        let numberOfRealSadFaces = 2
        let numberOfRealAngeryFaces = 2
        let numberOfRealScaredFaces = 3
        let numberOfRealDisgustFaces = 2
        let numberOfRealSurprisedFaces = 3
        
        for (var i = 1; i <= numberOfRealHappyFaces; i++) {
            realHappyFaces.append(UIImage(named: "RealHappy\(i)")!)
        }
        for (var i = 1; i <= numberOfRealSadFaces; i++) {
            realSadFaces.append(UIImage(named: "RealSad\(i)")!)
        }
        for (var i = 1; i <= numberOfRealAngeryFaces; i++) {
            realAngeryFaces.append(UIImage(named: "RealAngry\(i)")!)
        }
        for (var i = 1; i <= numberOfRealScaredFaces; i++) {
            realScaredFaces.append(UIImage(named: "RealScared\(i)")!)
        }
        for (var i = 1; i <= numberOfRealDisgustFaces; i++) {
            realDistedFaces.append(UIImage(named: "RealDisgust\(i)")!)
        }
        for (var i = 1; i <= numberOfRealSurprisedFaces; i++) {
            realSurprisedFaces.append(UIImage(named: "RealSuprised\(i)")!)
        }
        
        //declaring all of the emotion classes
        var happyClass     = EmotionClass(newName: "Happy", newEnum: EmotionEnum.HAPPY, newIcon: animatedHappyFaces[0], newAnimatedFace: animatedHappyFaces, newrealFace: realHappyFaces,newButtonColor: UIColor.yellowColor())
        var sadClass       = EmotionClass(newName: "Sad", newEnum: EmotionEnum.SAD, newIcon: animatedSadFaces[0], newAnimatedFace: animatedSadFaces, newrealFace: realSadFaces,newButtonColor: UIColor.blueColor())
        var angeryClass    = EmotionClass(newName: "Angry", newEnum: EmotionEnum.ANGERY, newIcon: animatedAngeryFaces[0], newAnimatedFace: animatedAngeryFaces, newrealFace: realAngeryFaces,newButtonColor: UIColor.redColor())
        var scaredClass    = EmotionClass(newName: "Scared", newEnum: .SCARED, newIcon: animatedScaredFaces[0], newAnimatedFace: animatedScaredFaces, newrealFace: realScaredFaces,newButtonColor: UIColor.purpleColor())
        var disgustedClass = EmotionClass(newName: "Disgusted", newEnum: .DISGUSTED, newIcon: animatedDistedFaces[0], newAnimatedFace: animatedDistedFaces, newrealFace: realDistedFaces,newButtonColor: UIColor.greenColor())
        var surprisedClass = EmotionClass(newName: "Surprised", newEnum: .SURPRISED, newIcon: animatedSurprisedFaces[0], newAnimatedFace: animatedSurprisedFaces, newrealFace: realSurprisedFaces,newButtonColor: UIColor.orangeColor())

        //adding all of the classes to the array
        theClasses.append(happyClass)
        theClasses.append(sadClass)
        theClasses.append(angeryClass)
        theClasses.append(scaredClass)
        theClasses.append(disgustedClass)
        theClasses.append(surprisedClass)
        
        return theClasses
    }
    
    //Don't know if will need
//    func FadeOutAnswer(){
//        println("in the func")
//        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
//            self.answerLabel.alpha = 0.0
//            }, completion: {
//                (finished: Bool) -> Void in
//                
//                self.answerLabel.texqt = nil
//                
//                UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
//                    self.answerLabel.alpha = 0.0
//                    }, completion: nil)
//        })
//    }
//    
//    
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

