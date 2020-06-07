//
//  PostController.swift
//  Fit Journey
//
//  Created by Annisa Nabila Nasution on 06/06/20.
//  Copyright © 2020 Annisa Nabila Nasution. All rights reserved.
//

import UIKit

protocol ReloadData {
    func reloadData()
}

class PostController: UIViewController {
    let datePicker = UIDatePicker()
    var date : Date?
    var pickerToolBar: UIToolbar!
    var delegate : ReloadData?
    
    
    @IBOutlet weak var caloriesTF: UITextField!
    
    @IBOutlet weak var titleTF: UITextField!
    
    @IBOutlet weak var durationTF: UITextField!
    
    @IBOutlet weak var dateTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        durationTF.keyboardType = .asciiCapableNumberPad
        caloriesTF.keyboardType = .asciiCapableNumberPad
        self.datePicker.datePickerMode = .dateAndTime
        self.datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        self.datePicker.maximumDate = Date()
        dateTF.inputView = self.datePicker
        dateTF.inputAccessoryView = self.pickerToolBar
        pickerToolBar = UIToolbar()
        pickerToolBar.isTranslucent = true
        pickerToolBar.sizeToFit()
    }
    
    @objc func dateChanged (datePicker : UIDatePicker, activeTF : UITextField) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM y hh:mm aa"
        dateTF.text = dateFormatter.string(from:datePicker.date)
        date = datePicker.date
    }
    
    @IBAction func onClick(_ sender: Any) {
        if titleTF.text == "" || durationTF.text == "" || dateTF.text == "" || caloriesTF.text == "" {
            let alert = UIAlertController(title: "Empty Field", message: "Make sure to fill all fields", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            let duration:Int? = Int(durationTF!.text!)
            let calories:Int? = Int(caloriesTF!.text!)
            DataStore().create(titleTF.text!, duration!, date!, calories!)
            print("data saved")
            delegate?.reloadData()
            let alert = UIAlertController(title: "Data Saved", message: "Your activity has been saved", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
            
        }
    }
}
