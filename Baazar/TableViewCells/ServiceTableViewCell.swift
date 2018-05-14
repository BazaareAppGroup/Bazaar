//
//  ServiceCategoryTableViewCell.swift
//  Baazar
//
//  Created by David King on 5/7/18.
//  Copyright © 2018 David King. All rights reserved.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ServiceName: UILabel!
    
    @IBOutlet weak var ServiceOverview: UILabel!
    
    var service : Bazaar.Service!{
        didSet{
            ServiceName.text = service.title
            ServiceOverview.text = service.overview
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
