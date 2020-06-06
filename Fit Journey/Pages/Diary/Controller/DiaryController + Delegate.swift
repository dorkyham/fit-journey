//
//  DiaryController + Delegate.swift
//  Fit Journey
//
//  Created by Annisa Nabila Nasution on 06/06/20.
//  Copyright © 2020 Annisa Nabila Nasution. All rights reserved.
//

import UIKit

extension DiaryController : UITableViewDelegate{
    
}

extension DiaryController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data!.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as? DataTableViewCell
        cell?.dataLabel.text = data?[indexPath.row].title
        cell?.dateLabel.text = data?[indexPath.row].date
        cell?.delegate = self
        return cell!
    }
    
    
}

extension DiaryController : CellDelegate {
    func buttonDidTap(){
        print("button tapped")
    }
}
