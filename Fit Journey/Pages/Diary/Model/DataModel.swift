//
//  DataModel.swift
//  Fit Journey
//
//  Created by Annisa Nabila Nasution on 06/06/20.
//  Copyright © 2020 Annisa Nabila Nasution. All rights reserved.
//

import UIKit

struct DataModel {
    var title : String?
    var date : String?
}

struct DataBuilder {
    func getItem(completionHandler: @escaping (([DataModel])) -> ()){
        completionHandler(
        [DataModel(title: "Lari Pagi", date: "Yesterday"),
         DataModel(title: "Work Out", date: "Today")])
    }
}
