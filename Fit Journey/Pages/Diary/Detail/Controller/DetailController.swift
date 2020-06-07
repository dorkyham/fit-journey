//
//  DetailController.swift
//  Fit Journey
//
//  Created by Annisa Nabila Nasution on 07/06/20.
//  Copyright © 2020 Annisa Nabila Nasution. All rights reserved.
//

import UIKit

class DetailController : UIViewController {
    
    @IBOutlet weak var detailTableView: UITableView!
    
    @IBOutlet weak var titleLabel: UILabel!
    var activityData : ActivityModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableView()
        titleLabel.text = activityData?.title
    }
    
    func loadTableView(){
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.register(UINib(nibName: "ActivityDataCell", bundle: nil), forCellReuseIdentifier: "detailCell")
        detailTableView.reloadData()
    }
}

extension DetailController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? ActivityDataCell
        if indexPath.row == 0 {
            cell?.activityTitle.text = "Minutes Performed"
            cell?.activityTF.text = "\(activityData?.duration ?? 0)"
        }
            
        else if indexPath.row == 1{
            let formatter = DateFormatter()
            //then again set the date format whhich type of output you need
            formatter.dateFormat = "dd-MMM-yyyy"
            // again convert your date to string
            let date = formatter.string(from: activityData!.date)
            cell?.activityTitle.text = "Exercise Date"
            cell?.activityTF.text = date
        }
        
        else if indexPath.row == 2{
                   cell?.activityTitle.text = "Calories Burned"
            cell?.activityTF.text = "\(activityData?.calories ?? 0)"
               }
            
        return cell!
    }
    
    
}
