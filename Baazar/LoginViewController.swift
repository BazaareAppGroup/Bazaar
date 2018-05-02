//
//  ViewController.swift
//  Baazar
//
//  Created by David King on 3/14/18.
//  Copyright © 2018 David King. All rights reserved.

//TO-DO create function to sign user up/in using the PARSE database
//TO-DO create alerts if there is error when signing up

import UIKit

import Parse


class LoginViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    @IBOutlet weak var UsernameText: UITextField!
    
    
    @IBOutlet weak var PasswordText: UITextField!
   
    
    
    
    @IBAction func SignInClicked(_ sender: AnyObject) {
        // print("Username \(UsernameText.text!)")
        var valid: Bool = loginUser(username: username, password: password) // this is to be changed if parse sign in executes succesfully

            if (UsernameText.text! == "" || PasswordText.text! == ""){
               
                print("Sign In Error")
                valid = false
                
            }
            
            
            
            if (valid == true) // executes if sign in is a success
            {
                
                print("sign in valid")
                performSegue(withIdentifier: "LoginSuccess", sender: nil)
            }
            
        }
        
        
        @IBAction func SignUpClicked(_ sender: AnyObject) {
            

            let username = UsernameText.text ?? ""
            let password = PasswordText.text ?? ""
            
            var valid: Bool =  registerUser(username: username, password: password)// this is to be changed if parse sign in executes succesfully
                
                if (UsernameText.text! == "" || PasswordText.text! == ""){
                   
                    print("Sign Up Error")
                    valid = false
                    
                }
                
                
                
                if (valid == true) // executes if sign in is a success
                {
                    
                    performSegue(withIdentifier: "LoginSuccess", sender: self)
                }
                
                
            }
            

            func loginUser(username: String, password: String) -> Bool{
                var returnVal: Bool = false
                
                
                activityIndicator.startAnimating()
                PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
                    if let error = error {
                        print("User log in failed: \(error.localizedDescription)")
                        let alert = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        self.activityIndicator.stopAnimating()
                    } else {
                        print("User logged in successfully")
                        // display view controller that needs to shown after successful login
                        self.performSegue(withIdentifier: "loginSegue", sender: nil)
                        returnVal = true
                    }
                }
                return returnVal
            }
            func registerUser(username: String, password: String) -> Bool{
                var returnVal: Bool = false
                // initialize a user object
                let newUser = PFUser()
                
                // set user properties
                newUser.username = UsernameText.text ?? ""
                newUser.password = PasswordText.text ?? ""
                
                
                
                // call sign up function on the object
                newUser.signUpInBackground { (success: Bool, error: Error?) in
                    if let error = error {
                        print(error.localizedDescription)
                        let alert = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    } else {
                        print("User Registered successfully")
                        // manually segue to logged in view
                        //self.performSegue(withIdentifier: "pushSegue" , sender: self)
                        returnVal = true
                    }
                }
                
                return returnVal
            }
          
            
            override func viewDidLoad() {
                super.viewDidLoad()
                // Do any additional setup after loading the view, typically from a nib.
            }
            
            override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
                // Dispose of any resources that can be recreated.
            }
            
            
     
                // can be called to let user know of a login or sign up error
            
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
            
            
            
}

