//
//  House.swift
//  RealEstate
//
//  Created by iJoyer Yip on 22/2/2017.
//  Copyright © 2017 iJoyer. All rights reserved.
//

import Foundation

class House: NSObject {
    var houseId: Int64
    var price: Int
    var size: Int
    var address: String
    var houseType: String
    var floor: Int
    var orientation: String
    var community: String
    var district: String
    
    var title: String!
    
    
    func setTitle() {
        setTitle(title: self.community)
    }
    
    func setTitle(title: String) {
        self.title = title
    }
    
    func getInfoList() -> [String]{
        let infoList = [String(describing: self.community),
                    String(describing: self.houseType),
                    String(describing: self.size) + "平方米",
                    String(describing: self.floor) + "楼",
                    String(describing: self.orientation),
                    String(describing: self.district)]
        return infoList
    }
    
    init(houseId: Int64,
         price: Int,
         size: Int,
         address: String,
         houseType: String,
         floor: Int,
         orientation: String,
         community: String,
         district: String) {
        self.houseId = houseId
        self.price = price
        self.size = size
        self.address = address
        self.houseType = houseType
        self.floor = floor
        self.orientation = orientation
        self.community = community
        self.district = district
        
        super.init()

        self.setTitle()
    }
    
}

var houses: [House]?
var delegateHouse: House?

let infoTitleList = ["小区", "户型", "面积", "楼层", "朝向", "区域"]
