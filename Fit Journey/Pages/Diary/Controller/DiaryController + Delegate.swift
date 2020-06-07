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
        
        let formatter = DateFormatter()
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "dd-MMM-yyyy"
        // again convert your date to string
        let date = formatter.string(from: (data?[indexPath.row].date)!)

        cell?.cellNumber = indexPath.row
        cell?.dateLabel.text = date
        cell?.delegate = self
        return cell!
    }
    
}

extension DiaryController : CellDelegate {
    
    func buttonDidTap(cellNumber:Int){
        print("button tapped")
        self.dataPerOne = data?[cellNumber]
        performSegue(withIdentifier: "goToDetailActivity", sender: nil)
    }
    
}
