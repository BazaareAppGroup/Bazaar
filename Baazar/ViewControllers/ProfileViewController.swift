//
//  ProfileViewController.swift
//  Baazar
//
//  Created by David King on 5/7/18.
//  Copyright © 2018 David King. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController, UITableViewDataSource{

    @IBOutlet weak var UserImageView: UIImageView!
    
    @IBOutlet weak var UsernameLabel: UILabel!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func MessagesClicked(_ sender: AnyObject) {
    }
    
    @IBAction func LogoutClicked(_ sender: AnyObject) {
        PFUser.logOut()
        
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login") as! UIViewController
        self.present(viewController, animated: true, completion: nil)
    }
    
    
    @IBAction func AddStoreClicked(_ sender: AnyObject) {
        
    //performSegue(withIdentifier: "AddHome", sender: self)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let user = PFUser.current() as! Bazaar.User
        if let avatar = user.avatar as? PFFile{
            do{
               try UserImageView.image = UIImage(data: avatar.getData() )
            }catch{
                print(error.localizedDescription)
            }
            
        }
        UsernameLabel.text = user.username
        
        tableView.dataSource = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        
        
        //replace with number of stores user owns
        return 3
        
        
    }
    
    
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
{
    let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
    
    // replace text with store name
    cell.StoreNameLabel.text = "ge"
    
    return cell
    
    
 }
    

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
    if (segue.identifier == "AddHome")
    {
        
       var addstore = segue.destination as! AddStoreViewController
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
