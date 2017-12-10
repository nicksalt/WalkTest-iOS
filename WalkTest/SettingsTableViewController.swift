//
//  SettingsTableViewController.swift
//  WalkTest
//
//  Created by Nick Salt on 2017-08-14.
//  Copyright © 2017 OHRI. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    let numberOfRowsAtSection: [Int] = [6, 6, 2, 1]
    let genders = ["Male", "Female"]
    let heightUnits = ["in", "cm"]
    let weightUnits = ["lbs", "kg"]

    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var heightUnitTextField: UITextField!
    @IBOutlet weak var weightUnitTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
        
        //Looks for single or multiple taps.
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        let genderPickerView = UIPickerView()
        
        genderPickerView.delegate = self
        
        genderPickerView.tag = 1
        
        genderTextField.inputView = genderPickerView
        genderTextField.text = genders[0]
        
        let heightPickerView = UIPickerView()
        
        heightPickerView.delegate = self
        
        heightPickerView.tag = 2
        
        heightUnitTextField.inputView = heightPickerView
        heightUnitTextField.text = heightUnits[0]

        let weightPickerView = UIPickerView()
        
        weightPickerView.delegate = self
        
        weightPickerView.tag = 3
        
        weightUnitTextField.inputView = weightPickerView
        weightUnitTextField.text = weightUnits[0]


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows: Int = 0
        
        if section < numberOfRowsAtSection.count {
            rows = numberOfRowsAtSection[section]
        }
        
        return rows
    }
    
    func numberOfComponents(in _: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 1 {
            
            return genders.count
            
        }
        
        if pickerView.tag == 2 {
            
            return heightUnits.count
            
        }
        
        if pickerView.tag == 3 {
            
            return weightUnits.count;
        }
        
        return 0
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 1 {
            
            return genders[row]
            
        }
        
        if pickerView.tag == 2 {
            
            return heightUnits[row]
            
        }
        if pickerView.tag == 3 {
            
            return weightUnits[row]
            
        }
        
        return nil
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 1 {
            
            genderTextField.text = genders[row]
            
        }
        
        if pickerView.tag == 2 {
            
            heightUnitTextField.text = heightUnits[row]
            
        }
        
        if pickerView.tag == 2 {
            
            weightUnitTextField.text = weightUnits[row]
            
        }
    }


   
}
