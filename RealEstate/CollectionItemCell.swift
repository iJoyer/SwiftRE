//
//  CollectionItemCell.swift
//  RealEstate
//
//  Created by iJoyer Yip on 20/2/2017.
//  Copyright © 2017 iJoyer. All rights reserved.
//

import UIKit

class CollectionItemCell: UICollectionViewCell {
    @IBOutlet weak var houseIcon: UIImageView!
    @IBOutlet weak var testLabel: UILabel!
    
    override func awakeFromNib() {
        
        houseIcon.layer.cornerRadius = 20
        houseIcon.clipsToBounds = true
        houseIcon.image = UIImage(named: "HouseIcon") ?? nil
        super.awakeFromNib()
    }
}
