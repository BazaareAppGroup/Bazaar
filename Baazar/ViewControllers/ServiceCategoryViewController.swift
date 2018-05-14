//
//  ServiceCategoryViewController.swift
//  Baazar
//
//  Created by David King on 5/7/18.
//  Copyright © 2018 David King. All rights reserved.
//

import UIKit
import Parse

class ServiceCategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    var services: [Bazaar.Service] = []
    
    var currentIndex : IndexPath?

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var CategoryLabel: UILabel!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell") as! ServiceTableViewCell
        cell.service = services[indexPath.row]
        return cell
    }
    
    @objc func refreshControlAction(_ refreshControl: UIRefreshControl){
        getServices()
        refreshControl.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControlEvents.valueChanged)
        
        tableView.refreshControl = refresh
        getServices()
        
        
        // Do any additional setup after loading the view.
    }
    
    func getServices(){
        let query = PFQuery(className: "Service")
        query.limit = 20
        query.findObjectsInBackground{(services: [PFObject]?, error: Error?) in
            if let services = services as? [Bazaar.Service]{
                self.services = services
                print(services)
                self.tableView.reloadData()
            }else{
                print(error?.localizedDescription)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentIndex = indexPath
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "ServiceDetial"){
            let vc = segue.destination as! ServiceViewController
            vc.service = services[ currentIndex!.row]
            
        }
    }
    

}
