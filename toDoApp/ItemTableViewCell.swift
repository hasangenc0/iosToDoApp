//
//  ItemTableViewCell.swift
//  firstApp
//
//  Created by Hasan genç on 24.08.2018.
//  Copyright © 2018 Hasan genç. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    @IBOutlet weak var nameLabel: UILabel!
}
