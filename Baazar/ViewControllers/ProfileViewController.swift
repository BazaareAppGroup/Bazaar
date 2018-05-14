//
//  ProfileViewController.swift
//  Baazar
//
//  Created by David King on 5/7/18.
//  Copyright © 2018 David King. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var UserImageView: UIImageView!
    
    @IBOutlet weak var UsernameLabel: UILabel!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var services : [Bazaar.Service] = []
    
    
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
    
    @IBAction func addProfilePic(_ sender: Any){
        print("photo tapped")
    
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = .photoLibrary
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        UserImageView.image = image
        let user = PFUser.current()!
        
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let user = PFUser.current()!
        UsernameLabel.text = user.username
        getServices()
        tableView.dataSource = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        
        
        //replace with number of stores user owns
        return services.count
        
        
    }
    
    
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
{
    let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
    
    // replace text with store name
    cell.service = services[indexPath.row]
    
    return cell
    
    
 }
    

    func getServices(){
        let query = PFQuery(className: "Service")
        query.limit = 20
        //query.whereKey("userId", contains: PFUser.current()?.objectId)
        //query.whereKey("userId", equalTo: PFUser.current()?.objectId)
        query.findObjectsInBackground(block: {(services: [PFObject]?, error: Error?) in
            if let services = services as? [Bazaar.Service]{
                self.services = services
                print(services)
                self.tableView.reloadData()
            }else{
                print(error?.localizedDescription)
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
    if (segue.identifier == "AddHome")
    {
        
       var addService = segue.destination as! AddServicesViewController
        
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
