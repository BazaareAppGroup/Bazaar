//
//  ViewController.swift
//  Baazar
//
//  Created by David King on 3/14/18.
//  Copyright © 2018 David King. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
   
    @IBOutlet weak var UsernameText: UITextField!
    
    
    @IBOutlet weak var PasswordText: UITextField!
    
    
    
    @IBAction func SignInClicked(_ sender: AnyObject) {
      // print("Username \(UsernameText.text!)")
        var valid: Bool = true // this is to be changed if parse sign in executes succesfully
        
        if (UsernameText.text! == "" || PasswordText.text! == ""){
            print("Sign In Error")
            valid = false
            
        }
        
    
        
        if (valid == true) // executes if sign in is a success
        {
            
            performSegue(withIdentifier: "LoginSuccess", sender: self)
        }
        
    }
    
    
    @IBAction func SignUpClicked(_ sender: AnyObject) {
        
        var valid: Bool = true // this is to be changed if parse sign in executes succesfully
        
        if (UsernameText.text! == "" || PasswordText.text! == ""){
            print("Sign Up Error")
            valid = false
            
        }
        
        
        
        if (valid == true) // executes if sign in is a success
        {
            
            performSegue(withIdentifier: "LoginSuccess", sender: self)
        }
        

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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



}

