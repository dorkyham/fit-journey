//
//  BrowseController.swift
//  Fit Journey
//
//  Created by Annisa Nabila Nasution on 07/06/20.
//  Copyright © 2020 Annisa Nabila Nasution. All rights reserved.
//

import UIKit
import AVFoundation

class BrowseController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.register(UINib(nibName: "VideoCollectionView", bundle: nil), forCellReuseIdentifier: "videoCell")
        tableView.reloadData()
    }
}

extension BrowseController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 234
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let url : URL = URL(string: "https://youtu.be/2pLT-olgUJs")!
        let cell  = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as? VideoViewCell
        
        cell?.addPlayer(for: url)
        
        return cell!
    }
    
    
    
}
