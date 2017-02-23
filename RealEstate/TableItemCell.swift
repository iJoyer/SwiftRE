//
//  TableItemCell.swift
//  RealEstate
//
//  Created by iJoyer Yip on 20/2/2017.
//  Copyright © 2017 iJoyer. All rights reserved.
//

import UIKit

class TableItemCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var houseIcon: UIImageView!
    
    override func awakeFromNib() {
        houseIcon.layer.cornerRadius = 10
        houseIcon.clipsToBounds = true
        houseIcon.image = UIImage(named: "HouseIcon") ?? nil
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
