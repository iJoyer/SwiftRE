//
//  SomeCode.swift
//  RealEstate
//
//  Created by iJoyer Yip on 19/2/2017.
//  Copyright © 2017 iJoyer. All rights reserved.
//

/*
 if (self.endContentY! - self.beginContentY! > 150 && self.endContentY! > 250) {
 UIView.animate(withDuration: 0.1, animations: {
 var rect:CGRect = (self.navigationController?.navigationBar.frame)!;
 rect.origin.y = -44;
 self.navigationController?.navigationBar.frame = rect;
 })
 }
 else if (self.endContentY! - self.beginContentY! < 0) {
 UIView.animate(withDuration: 0.1, animations: {
 var rect: CGRect = (self.navigationController!.navigationBar.frame);
 rect.origin.y = 20;
 self.navigationController?.navigationBar.frame = rect;
 })
 }
 

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "12" {
        let controller = segue.destination as! DetailsTableViewController
        controller.item = sender as? Item
 
 self.performSegue(withIdentifier: "12",sender: item);
    }
}
 */
