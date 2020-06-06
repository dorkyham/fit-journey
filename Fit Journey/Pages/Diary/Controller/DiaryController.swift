//
//  DiaryController.swift
//  Fit Journey
//
//  Created by Annisa Nabila Nasution on 06/06/20.
//  Copyright © 2020 Annisa Nabila Nasution. All rights reserved.
//

import UIKit
import CloudKit

class DiaryController : UIViewController {
    
    var data : [DataModel]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        loadTableView()
        DataBuilder().getItem { (data) in
            self.data = data
        }
    }
    
    func loadTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DataListCell", bundle: nil), forCellReuseIdentifier: "dataCell")
    }
}
