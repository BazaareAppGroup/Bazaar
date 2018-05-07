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
        @NSManaged var stores: [Store]
        
        static func parseClassName() -> String {
            return "Category"
        }
        
        
    }
    
    class Store: PFObject, PFSubclassing {
        @NSManaged var owner : PFUser
        @NSManaged var services : [Service]
        @NSManaged var title : String
        @NSManaged var image : PFFile?
        
        static func parseClassName() -> String {
            return "Store"
        }
        
        
    }
    class Service: PFObject, PFSubclassing {
        @NSManaged var category: Category
        @NSManaged var overview : String
        @NSManaged var title : String
        
        static func parseClassName() -> String {
            return "Service"
        }
        
        
    }
    class User: PFUser{
        
        @NSManaged var screen_name : String
        @NSManaged var avatar: PFFile
        
        
        
    }
}
