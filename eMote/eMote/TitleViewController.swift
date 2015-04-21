//
//  TitleViewController.swift
//  eMote
//
//  Created by owen mack on 4/16/15.
//  Copyright (c) 2015 Owen Mack. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {

    override func viewDidLoad() {
       
        let imageName = "eMoteLogo.png"
        let image = UIImage(named: imageName)
  

      
        
        for i in 0...5
        
        {
            
            
         
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 100)
            self.view.addSubview(imageView)
        
        // randomly create a value between 0.0 and 150.0
        let randomYOffset = CGFloat( arc4random_uniform(150))
        
        // for every y-value on the bezier curve
        // add our random y offset so that each individual animation
        // will appear at a different y-position
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 16,y: 239 + randomYOffset))
        path.addCurveToPoint(CGPoint(x: 301, y: 239 + randomYOffset), controlPoint1: CGPoint(x: 136, y: 373 + randomYOffset), controlPoint2: CGPoint(x: 178, y: 110 + randomYOffset))
        
        // create the animation
        let anim = CAKeyframeAnimation(keyPath: "position")
        anim.path = path.CGPath
        anim.rotationMode = kCAAnimationRotateAuto
        anim.repeatCount = Float.infinity
            anim.duration = Double(arc4random_uniform(40)+30) / 10
            
            // stagger each animation by a random value
            // `290` was chosen simply by experimentation
            anim.timeOffset = Double(arc4random_uniform(290))
        
        // add the animation
        imageView.layer.addAnimation(anim, forKey: "animate position along path")
        }
        super.viewDidLoad()
        



        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
