//
//  ChatViewController.swift
//  ParseChat
//
//  Created by ARG Lab on 2/24/18.
//  Copyright © 2018 Odin. All rights reserved.
//

import UIKit
import Parse


class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , UITextFieldDelegate{
    
    @IBOutlet weak var chatBar: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var toolBar: UIToolbar!
    
    var service : Bazaar.Service!
    
    
    var posts : [AnyObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 40
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)
        chatBar.becomeFirstResponder()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func send_message(_ sender: Any) {
        let chatMessage = PFObject(className: "Message")
        chatMessage["text"] = chatBar.text ?? ""
        chatMessage["user"] = PFUser.current()
        chatMessage["userId"] = PFUser.current()?.objectId
        chatMessage["recieverId"] = service.user.objectId
        chatMessage.saveInBackground{(success, error) in
            if success {
                print("Message was saved")
                self.chatBar.text  = ""
                
            }else if let error = error{
                print("error : \(error.localizedDescription)")
            }
            
        }
    }
    
    @objc func onTimer(){
        
        let query = PFQuery(className: "Message")
        query.addDescendingOrder("createdAt")
        query.includeKey("user")
        query.findObjectsInBackground(block: { (posts : [PFObject]?, error: Error?) -> Void in
            if error == nil {
                self.posts = posts!
                
                self.tableView.reloadData()
            }else{
                print(error?.localizedDescription)
            }
        })
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! MessageCell
        
        let post = posts[indexPath.row] as! PFObject
        print(post)
        
        if let user = post["user"] as? PFUser{
            cell.user.text = user.username
        }else{
            cell.user.text = "😀"
        }
        if let bubble = post["recieverId"] as? String{
            if ( bubble == PFUser.current()?.objectId) {
                cell.bubleView.backgroundColor = UIColor(red: 0.54, green: 0.156, blue: 0.19, alpha: 1.0)
            }else{
                cell.bubleView.backgroundColor = UIColor(red:0.16, green:0.50, blue:0.73, alpha:1.0)
            }
        }
        cell.message.text = post["text"] as! String
        
        return cell
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
