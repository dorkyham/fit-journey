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
    
    var data : [ActivityModel]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        loadTableView()
        self.data = DataStore().retrieve()
    }
    @IBAction func writeIsTapped(_ sender: Any) {
        print("button write is tapped")
        performSegue(withIdentifier: "goToWritePost", sender: nil)
    }
    
    func loadTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DataListCell", bundle: nil), forCellReuseIdentifier: "dataCell")
    }
}
