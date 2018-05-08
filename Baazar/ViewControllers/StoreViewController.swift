//
//  StoreViewController.swift
//  Baazar
//
//  Created by David King on 5/7/18.
//  Copyright © 2018 David King. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var StoreNameLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func AddServicesClicked(_ sender: AnyObject) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // number of services
        
        
        
        return 3
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreServiceTableViewCell", for: indexPath) as! StoreServiceTableViewCell
        
        cell.ServiceNameLabel.text = "service 1"
        
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
