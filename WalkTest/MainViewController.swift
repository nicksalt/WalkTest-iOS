//
//  FirstViewController.swift
//  WalkTest
//
//  Created by Nick Salt on 2017-08-11.
//  Copyright © 2017 OHRI. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    //MARK: Properties


    @IBOutlet weak var pickerTextField: UITextField!
    
    var pickOption = ["2 minute walk", "6 minute walk"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pickerView = UIPickerView()
        
        pickerView.delegate = self
        pickerTextField.inputView = pickerView
        pickerTextField.text = pickOption[0]
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MainViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

        
        view.addGestureRecognizer(tap)
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }

    func numberOfComponents(in _: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOption.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOption[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = pickOption[row]
    }

}

