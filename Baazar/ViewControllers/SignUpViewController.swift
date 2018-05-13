//
//  ViewController.swift
//  Baazar
//
//  Created by ARG Lab on 5/11/18.
//  Copyright © 2018 David King. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var UsernameField: UITextField!

    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var cancelClick: UIButton!
    
    @IBOutlet weak var register: UIButton!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SignUpClicked(_ sender: AnyObject) {
        
        
        let username = UsernameField.text
        let password = passwordField.text
        
        let image = profileImage.image
        
        if let username = username{
            if let password = password{
                registerUser(username: username, password: password, photo: )// this is to be changed if parse sign in executes succesfully
            }else{
                alert(Title: "", Message: "Need password")
            }
        }else{
            alert(Title: "", Message: "Need username")
        }
        
        
        
        
        
    }
    
    func registerUser(username: String, password: String, photo: UIImage) -> Bool{
        var returnVal: Bool = false
        // initialize a user object
        let newUser = PFUser()
        
        
        
        // set user properties
        newUser.username = username
        newUser.password = password
        
        if let image = image{
            if let imageData = UIImagePNGRepresentation(image){
                let file =  PFFile(name: "image.png", data: imageData)
                newUser.add(file, forKey: "avatar")
                
            }
        }
        
        
        
        activityIndicator.startAnimating()
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
                let alert = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.activityIndicator.stopAnimating()
                self.present(alert, animated: true, completion: nil)
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
                self.activityIndicator.stopAnimating()
                self.performSegue(withIdentifier: "loginSuccess" , sender: self)
                returnVal = true
            }
        }
        
        return returnVal
    }
    
    func alert(Title: String, Message: String){
        
        let alertController = UIAlertController(title: Title, message: Message, preferredStyle: .alert)
        
        var okAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
            // handle case of user logging out
        }
        // add the logout action to the alert controller
        alertController.addAction(okAction)
        
        present(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }
        
        
        
        
        
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
