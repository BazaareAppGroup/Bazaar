//
//  ProfileViewController.swift
//  Baazar
//
//  Created by David King on 5/7/18.
//  Copyright © 2018 David King. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var UserImageView: UIImageView!
    
    @IBOutlet weak var UsernameLabel: UILabel!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func MessagesClicked(_ sender: AnyObject) {
    }
    
    
    
    @IBAction func AddStoreClicked(_ sender: AnyObject) {
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
