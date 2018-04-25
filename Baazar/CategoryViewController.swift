//
//  CategoryViewController.swift
//  Baazar
//
//  Created by David King on 4/19/18.
//  Copyright © 2018 David King. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource {
// change to table view maybe
    
    var categories: [String] = ["a","d","d"] // array will be filled with names of categories
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        
        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumInteritemSpacing = 3
        
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        
        let cellsPerLine:CGFloat  = 3
        
        let interItemSpacingTotal = layout.minimumInteritemSpacing * (cellsPerLine - 1)
        
        let width = collectionView.frame.size.width / cellsPerLine - interItemSpacingTotal / cellsPerLine
        
        layout.itemSize = CGSize(width: width, height: width * 3 / 2)
        

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
    
        return categories.count
    }
    
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryView", for: indexPath) as! CategoryCollectionViewCell
        
        let category = categories[indexPath.item]
        
        cell.CategoryLabel.text = category
        
        return cell
        
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
