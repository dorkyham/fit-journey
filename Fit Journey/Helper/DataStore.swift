//
//  DataStore.swift
//  Fit Journey
//
//  Created by Annisa Nabila Nasution on 06/06/20.
//  Copyright © 2020 Annisa Nabila Nasution. All rights reserved.
//

import CoreData
import UIKit

struct ActivityModel{
    let title: String
    let duration: Int
    let date : Date
    let calories : Int
}

class DataStore {
    
    // fungsi tambah data
    func create(_ title:String, _ duration:Int, _ date:Date, _ calories: Int){
        
        // referensi ke AppDelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        // managed context
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // refensi entity yang telah dibuat sebelumnya
        let userEntity = NSEntityDescription.entity(forEntityName: "Activity", in: managedContext)
        
        // entity body
        let insert = NSManagedObject(entity: userEntity!, insertInto: managedContext)
        insert.setValue(title, forKey: "title")
        insert.setValue(duration, forKey: "duration")
        insert.setValue(date, forKey: "date")
        insert.setValue(calories, forKey: "calories")
        
        do{
            // save data ke entity user core data
            try managedContext.save()
        }catch let err{
            print(err)
        }
        
    }
    
    // fungsi refrieve semua data
    func retrieve() -> [ActivityModel]{
        
        var activities = [ActivityModel]()
        
        // referensi ke AppDelegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // managed context
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // fetch data
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Activity")
        
        do{
            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            
            result.forEach{ activity in
                activities.append(
                    ActivityModel(
                        title: activity.value(forKey: "title") as! String, duration: activity.value(forKey: "duration") as! Int, date: activity.value(forKey: "date") as! Date, calories: activity.value(forKey: "calories") as! Int
                    )
                )
            }
        }catch let err{
            print(err)
        }
        
        return activities
        
    }
    
//
//    func update(_ firstName:String, _ lastName:String, _ email:String){
//
//        // referensi ke AppDelegate
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//
//        // managed context
//        let managedContext = appDelegate.persistentContainer.viewContext
//
//        // fetch data to delete
//        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "User")
//        fetchRequest.predicate = NSPredicate(format: "email = %@", email)
//
//        do{
//            let fetch = try managedContext.fetch(fetchRequest)
//            let dataToUpdate = fetch[0] as! NSManagedObject
//            dataToUpdate.setValue(firstName, forKey: "first_name")
//            dataToUpdate.setValue(lastName, forKey: "last_name")
//            dataToUpdate.setValue(email, forKey: "email")
//
//            try managedContext.save()
//        }catch let err{
//            print(err)
//        }
//
//    }
//
//    // fungsi menghapus by email user
    func delete(_ row: Int){

        // referensi ke AppDelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        // managed context
        let managedContext = appDelegate.persistentContainer.viewContext

        // fetch data to delete
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Activity")
        //fetchRequest.predicate = NSPredicate(format: "email = %@", email)

        do{
            let dataToDelete = try managedContext.fetch(fetchRequest)[row] as! NSManagedObject
            managedContext.delete(dataToDelete)

            try managedContext.save()
        }catch let err{
            print(err)
        }
    }
}
