//
//  EmotionClass.swift
//  AppJamGame2
//
//  Created by owen mack on 4/15/15.
//  Copyright (c) 2015 Owen Mack. All rights reserved.
//

import Foundation
import UIKit

enum EmotionEnum{
    case HAPPY
    case SAD
    case ANGERY
    case SCARED
    case DISGUSTED
    case SURPRISED
}

public class EmotionClass{
    
    private var name: String!
    private var theEnum: EmotionEnum!
    private var icon: UIImage!
    private var animatedFace: [UIImage]!
    private var realFace: [UIImage]!
    
    
    init(var newName: String, var newEnum: EmotionEnum, var newIcon: UIImage,
        var newAnimatedFace: [UIImage],var newrealFace: [UIImage])
    {
        name = newName
        theEnum = newEnum
        icon = newIcon
        animatedFace = newAnimatedFace
        realFace = newrealFace
    }
    
    func GetName()->String {return name}
  
    func GetEnum()->EmotionEnum {return theEnum}
    
    func GetIcon()->UIImage {return icon}
    
    func GetAnimatedFace()->[UIImage] {return animatedFace}
    
    func GetRealFace()->[UIImage] {return realFace}
}
