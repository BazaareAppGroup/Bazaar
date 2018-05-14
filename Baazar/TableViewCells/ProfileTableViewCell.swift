//
//  ProfileTableViewCell.swift
//  Baazar
//
//  Created by David King on 5/7/18.
//  Copyright © 2018 David King. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var serviceName: UILabel!
    
    @IBOutlet weak var overview: UILabel!
    
    var service : Bazaar.Service!{
        didSet{
            serviceName.text = service.title
            overview.text = service.overview
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
