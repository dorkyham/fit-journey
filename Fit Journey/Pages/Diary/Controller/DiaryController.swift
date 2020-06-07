//
//  DiaryController.swift
//  Fit Journey
//
//  Created by Annisa Nabila Nasution on 06/06/20.
//  Copyright © 2020 Annisa Nabila Nasution. All rights reserved.
//

import UIKit
import CoreData

class DiaryController : UIViewController, ReloadData {
    
    var data : [ActivityModel]?
    var dataPerOne : ActivityModel?
    var calories : Int? = 0
    
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.data = DataStore().retrieve()
        self.loadTableView()
        
        for oneData in data!{
            calories! += oneData.calories
        }
        
        caloriesLabel.text = "\(calories ?? 0)"
        
    }
    @IBAction func writeIsTapped(_ sender: Any) {
        print("button write is tapped")
        performSegue(withIdentifier: "goToWritePost", sender: nil)
    }
    
    func loadTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DataListCell", bundle: nil), forCellReuseIdentifier: "dataCell")
        tableView.reloadData()
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.loadTableView()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWritePost" {
            let destinationVC = segue.destination as! PostController
            destinationVC.delegate = self
        }
        
        else if segue.identifier == "goToDetailActivity" {
            let destinationVC = segue.destination as! DetailController
            destinationVC.activityData = dataPerOne
        }
    }
    
}

