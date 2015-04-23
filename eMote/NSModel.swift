//
//  NSModel.swift
//  eMote
//
//  Created by John C Van Hoogenstyn on 4/19/15.
//  Copyright (c) 2015 Owen Mack. All rights reserved.
//

import UIKit
import CoreData

@objc(Show)
class NSModel: NSManagedObject
{
   
    @NSManaged var note: String
    @NSManaged var emotion: String
    
}
