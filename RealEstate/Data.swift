//
//  Data.swift
//  RealEstate
//
//  Created by iJoyer Yip on 17/2/2017.
//  Copyright © 2017 iJoyer. All rights reserved.
//

import Foundation
import SQLite

var startDate, endDate: Date?
//To test algorithms

class DataManager: NSObject {
    
    var database: Connection?
    var userDatabase: Connection?
    
    let housesTable = Table("Houses")
    let houseID = Expression<Int64>("HouseID")
    let price = Expression<Int>("Price")
    let size = Expression<Int>("Size")
    let address = Expression<String>("Address")
    let houseType = Expression<String>("HouseType")
    let floor = Expression<Int?>("Floor")
    let orientation = Expression<String>("Orientation")
    let community = Expression<String>("Community")
    let district1 = Expression<String>("District1")
    let district2 = Expression<String>("District2")
    let district = Expression<String>("District")
    
    
    
    func ConnectToUserDatabase() {
        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        //Get Documents Path
        NSLog("Documents Path: \(docPath)")
        userDatabase = try? Connection("\(docPath)/UserDatabase.sqlite3")
        try! userDatabase?.run(housesTable.create(temporary: false, ifNotExists: true, block: { (table) in
            table.column(houseID, primaryKey: true)
            table.column(price)
            table.column(size)
            table.column(houseType)
            table.column(floor, defaultValue: 0)
            table.column(orientation)
            table.column(community)
            table.column(address)
            table.column(district)
        }))
        
        
    }
    
    
    
    func ConnectToResource() {
        let dbResourcePath = Bundle.main.path(forResource: "Database", ofType: "sqlite3")
        NSLog("Database Resource Path: " + dbResourcePath!)
        database = try? Connection(dbResourcePath!)
    }
    
    func GetHouseData() -> [House] {
        var houses =  [House]()
        var i: Int64 = 0
        for house in (try! database?.prepare(housesTable))! {
            houses.append(House(houseId: i,
                price: house[price],
                size: house[size],
                address: house[address],
                houseType: house[houseType],
                floor: house[floor] ?? 0,
                orientation: house[orientation],
                community: house[community],
                district: house[district1] + " " + house[district2]
            ))
            i += 1
        }
        return houses
    }
}




