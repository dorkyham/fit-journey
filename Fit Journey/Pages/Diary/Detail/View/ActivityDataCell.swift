//
//  ActivityDataCell.swift
//  Fit Journey
//
//  Created by Annisa Nabila Nasution on 07/06/20.
//  Copyright © 2020 Annisa Nabila Nasution. All rights reserved.
//

import UIKit

class ActivityDataCell: UITableViewCell {

    @IBOutlet weak var activityTitle: UILabel!
    
    @IBOutlet weak var activityTF: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
