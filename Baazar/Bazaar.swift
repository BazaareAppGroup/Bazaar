//
//  Bazaar.swift
//  Baazar
//
//  Created by ARG Lab on 5/2/18.
//  Copyright © 2018 David King. All rights reserved.
//

import Foundation
import Parse

class Bazaar {
    
    
    
    class Category: PFObject, PFSubclassing {
        
        @NSManaged var category : String
        @NSManaged var items: Int
        
        static func parseClassName() -> String {
            return "Categories"
        }
        
        
    }
}
