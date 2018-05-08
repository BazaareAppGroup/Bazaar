//
//  StoreServiceTableViewCell.swift
//  Baazar
//
//  Created by David King on 5/7/18.
//  Copyright © 2018 David King. All rights reserved.
//

import UIKit

class StoreServiceTableViewCell: UITableViewCell {

    @IBOutlet weak var ServiceNameLabel: UILabel!
    
    @IBOutlet weak var ServiceOverviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
