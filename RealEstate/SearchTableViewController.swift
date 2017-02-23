//
//  SearchTableViewController.swift
//  RealEstate
//
//  Created by iJoyer Yip on 16/2/2017.
//  Copyright © 2017 iJoyer. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    var searchController = UISearchController()
    //let testArray = ["长风一村", "华东师范大学第五宿舍"]
    var searchArray:[House] = [House]() {
        didSet {self.tableView.reloadData()}
    }
    
    func setSearchBar() {
        let view = UIView()
        view.frame = CGRect(x: 10, y: 0, width: UIScreen.main.bounds.width - 20, height: 44)
        view.addSubview(searchController.searchBar)
        view.tag = 301
        self.navigationController?.navigationBar.addSubview(view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        self.searchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.hidesNavigationBarDuringPresentation = false
            controller.dimsBackgroundDuringPresentation = false
            return controller
        })()
        let searchBar = searchController.searchBar
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "搜索"
        searchBar.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 44)
    }

    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.searchController.isActive {
            return self.searchArray.count
        }
        return houses!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell", for: indexPath) as? TableItemCell
        if self.searchController.isActive {
            cell?.nameLabel.text = self.searchArray[indexPath.row].title
            return cell!
        }
        cell?.nameLabel.text = houses?[indexPath.row].title
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegateHouse = houses?[indexPath.row]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = ""
        setSearchBar()
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        for view in (self.navigationController?.navigationBar.subviews)! {
            if (view.tag == 301) {
                view.removeFromSuperview()
            }
        }
        self.navigationItem.title = "搜索"
        super.viewWillDisappear(animated)
    }
    
}


extension SearchTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    
        self.searchArray = (houses?.filter {
            (s) -> Bool in return s.title.contains(searchController.searchBar.text!)
            })!
    }
}
