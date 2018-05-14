//
//  Bazaar.swift
//  Baazar
//
//  Created by ARG Lab on 5/2/18.
//  Copyright © 2018 David King. All rights reserved.
//

import Foundation
import Parse

extension PFUser{
    @NSManaged var screen_name : String
    @NSManaged var avatar: PFFile
    @NSManaged var stores: Int
}

class Bazaar {
    
    
    
    class Category: PFObject, PFSubclassing {
        
        @NSManaged var category : String
        @NSManaged var items: Int
        @NSManaged var services: [Service]
        
        static func parseClassName() -> String {
            return "Category"
        }
        
        
    }
    
    class Location: PFObject, PFSubclassing {
        
        @NSManaged var point: PFGeoPoint
        
        
        
        static func parseClassName() -> String {
            return "Location"
        }
    }
    
    class Store: PFObject, PFSubclassing {
        @NSManaged var owner : PFUser
        @NSManaged var services : [Service]
        @NSManaged var title : String
        @NSManaged var image : PFFile?
        @NSManaged var location: Location
        
        static func parseClassName() -> String {
            return "Store"
        }
        func setPFFileFromImage(image: UIImage?){
            
            if let image = image{
                if let imageData = UIImagePNGRepresentation(image){
                    let file =  PFFile(name: "image.png", data: imageData)
                    self.image = file!
                    
                }
            }
            
        }
        
        func saveStore(owner: PFUser, services: [Service], title: String){
            
        }
        
        
    }
    
    
    
    class Service: PFObject, PFSubclassing {
        @NSManaged var category: String
        @NSManaged var overview : String
        @NSManaged var title : String
        @NSManaged var user: PFUser
        @NSManaged var userId: String
        
        static func parseClassName() -> String {
            return "Service"
        }
        
        func addService(category: String, overview: String, title: String, user: PFUser, completion: @escaping PFBooleanResultBlock){
            let service = Service()
            service.overview = overview
            service.title = title
            service.user = user
            service.userId = user.objectId!
            service.category = category
            
            service.saveInBackground(block: completion)
        }
        
    }
    
    static func alert(Title: String, Message: String, viewController: UIViewController){
        
        let alertController = UIAlertController(title: Title, message: Message, preferredStyle: .alert)
        
        var okAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
            // handle case of user logging out
        }
        // add the logout action to the alert controller
        alertController.addAction(okAction)
        
        viewController.present(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }
        
        
        
        
        
    }
    
}

