//
//  AddServicesViewController.swift
//  Baazar
//
//  Created by David King on 5/7/18.
//  Copyright © 2018 David King. All rights reserved.
//

import UIKit
import Parse

class AddServicesViewController: UIViewController {

    @IBOutlet weak var ServiceName: UITextField!
    
    @IBOutlet weak var ServiceDetailsTextView: UITextView!
    
    @IBOutlet weak var CategoryField: UITextField!
    
    
    var service : Bazaar.Service!{
        didSet{
            ServiceName.text = service.title
            ServiceDetailsTextView.text = service.overview
        }
    }
    
    
    
    @IBAction func PostClicked(_ sender: AnyObject) {
        
        Bazaar.Service().addService(category: CategoryField.text!.lowercased(), overview: ServiceDetailsTextView.text, title: ServiceName.text!, user: PFUser.current()!){
            (state: Bool?, error: Error?) in
            if let state = state{
                self.performSegue(withIdentifier: "backSegue", sender: nil)
                
            }else{
                Bazaar.alert(Title: "", Message: error!.localizedDescription, viewController: self)
            }
        }
        
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
