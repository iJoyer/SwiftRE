//
//  MainViewController.swift
//  RealEstate
//
//  Created by iJoyer Yip on 7/2/2017.
//  Copyright © 2017 iJoyer. All rights reserved.
//

import UIKit


class MainViewController: UITableViewController {

    
    var headerView: UIImageView!
    let headerHeight: CGFloat = 125.0
  
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentOffset" {
            if (tableView.contentOffset.y < (-headerHeight - 64)) {
                self.headerView.frame = CGRect(x: 0, y: tableView.contentOffset.y + 64, width: self.view.frame.size.width, height: headerView.frame.size.height)
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        endDate = Date()
        let interval = endDate!.timeIntervalSince(startDate!)
        NSLog("Loading Time: %.24f", interval)
        //To test algorithm
        
        
        headerView = UIImageView(frame: CGRect(x: 0, y: -headerHeight, width: self.view.frame.width, height: headerHeight))
        headerView.image = UIImage(named: "MainCover") ?? nil
        tableView.addSubview(headerView)
        
        tableView.contentInset = UIEdgeInsets.init(top: headerView.frame.size.height, left: 0, bottom: 0, right: 0)
        tableView.addObserver(self, forKeyPath: "contentOffset", options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
