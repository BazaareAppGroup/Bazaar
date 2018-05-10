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
    
    var category : Bazaar.Category!{
        didSet{
            stores = category.stores
            CategoryLabel.text = category.category
            
        }
    }
    
    var stores : [Bazaar.Store] = []
    var services: [Bazaar.Service] = []

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var CategoryLabel: UILabel!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCell") as! StoreServiceTableViewCell
        
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
        let query = PFQuery(className: "Services")
        query.limit = 20
        query.findObjectsInBackground(block: {(services: [PFObject]?, error: Error?) in
            if error == nil{
                self.services = services! as! [Bazaar.Service]
                self.tableView.reloadData()
            }else{
                print(error?.localizedDescription)
            }
        })
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
