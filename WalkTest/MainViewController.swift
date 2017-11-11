//
//  FirstViewController.swift
//  WalkTest
//
//  Created by Nick Salt on 2017-08-11.
//  Copyright © 2017 OHRI. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    //MARK: Properties
    
    // This constraint ties an element at zero points from the bottom layout guide
    @IBOutlet var keyboardHeightLayoutConstraint: NSLayoutConstraint?
    @IBOutlet weak var walkTimePicker: UIPickerView!
    
    var walkTimes = ["2 minute walk", "6 minute walk"]
    
    @IBOutlet weak var walkLengthTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.walkTimePicker.dataSource = self;
        self.walkTimePicker.delegate = self;
        NotificationCenter.default.addObserver(self, selector: #selector(FirstViewController.keyboardWillShow(sender:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(FirstViewController.keyboardWillHide(sender:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return walkTimes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return walkTimes[row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

    
    //MARK: Actions
    
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -100 // Move view 100 points upward
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    



}

