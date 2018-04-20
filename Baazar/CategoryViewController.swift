//
//  CategoryViewController.swift
//  Baazar
//
//  Created by David King on 4/19/18.
//  Copyright © 2018 David King. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UISearchBarDelegate {

  
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //removes the defaultt text before editing
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.text = ""
    }
    
    
    //put default text back search bar if text doesnt change
    
    //this function should also user to search for category or services not sure which
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar){
        
        if ((searchBar.text?.isEmpty)! || searchBar.text == " "){
            
            searchBar.text = "search for services"
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
