//
//  InfoCell.swift
//  RealEstate
//
//  Created by iJoyer Yip on 19/2/2017.
//  Copyright © 2017 iJoyer. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {

    var infoList: [String]?
    var house: House?
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoContentCell")
        
        cell?.textLabel?.text = infoTitleList[indexPath.row]
        cell?.detailTextLabel?.text = infoList?[indexPath.row]
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoTitleList.count
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        house = delegateHouse
        infoList = house!.getInfoList()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
