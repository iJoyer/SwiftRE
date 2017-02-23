//
//  Item.swift
//  RealEstate
//
//  Created by iJoyer Yip on 7/2/2017.
//  Copyright © 2017 iJoyer. All rights reserved.
//

import Foundation

class Location: NSObject {
    var address: String
    var x: Float
    var y: Float
    init(address: String, x: Float, y: Float) {
        self.address = address
        self.x = x
        self.y = y
        super.init()
    }
}


class Item: NSObject {
    var name: String
    var price: Int
    var size: CGFloat
    var location: Location
    var floor: Int
    var orientation: String
    var houseType: String
    
    var value: Int
    
    init(name: String,
         price: Int,
         size: CGFloat,
         location: Location,
         floor: Int,
         orientation: String,
         houseType: String) {
        self.name = name
        self.price = price
        self.size = size
        self.location = location
        self.floor = floor
        self.orientation = orientation
        self.houseType = houseType
        self.value = 0
        //!!!
        
        
        super.init()
    }
    
    
}

let testLocation = Location(address: "常熟路108弄", x: 10.00, y: 20.00)
let testItem = Item(name: "荣康别墅",
                    price: 2500,
                    size: 9.00,
                    location: testLocation,
                    floor: 4,
                    orientation: "朝北",
                    houseType: "1室 0厅" )
let testItem2 = Item(name: "别墅",
                    price: 2500,
                    size: 9.00,
                    location: testLocation,
                    floor: 4,
                    orientation: "朝北",
                    houseType: "1室 0厅" )
var delegateItem: Item!
