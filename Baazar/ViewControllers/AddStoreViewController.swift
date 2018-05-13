//
//  AddStoreViewController.swift
//  Baazar
//
//  Created by David King on 5/7/18.
//  Copyright © 2018 David King. All rights reserved.
//

import UIKit
import Parse

class AddStoreViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate{
   
    
    @IBOutlet weak var StoreTitle: UITextField!
    
    @IBOutlet weak var StoreImage: UIImageView!
    
    @IBAction func PostClicked(_ sender: AnyObject) {
        let store = Bazaar.Store()
        let user = PFUser.current() as! Bazaar.User
        if let image = StoreImage.image{
            store.setPFFileFromImage(image: image)
        }
        store.owner = user
        if let title = StoreTitle.text{
            store.title = title
        }else{
            let alert = UIAlertController(title: nil, message: "title needed", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        }
        
        store.saveInBackground{
            (state : Bool, error: Error?) -> () in
            if state {
                print("item saved")
                user["stores"] = user.stores + 1
                do{
                    try user.save()
                }catch{
                    
                }
                
            }else{
                let alert = UIAlertController(title: nil, message: error?.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            }
            
        }
    }
    
    @IBAction func takePicture(_ sender: Any) {
        print("take picture")
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = .photoLibrary
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        StoreImage.image = image
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
