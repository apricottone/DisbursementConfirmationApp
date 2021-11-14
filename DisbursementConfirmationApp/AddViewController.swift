//
//  AddViewController.swift
//  DisbursementConfirmationApp
//
//  Created by mizoz on 2021/11/14.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var itemField: UITextField!
    @IBOutlet weak var costField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.backgroundColor = .white
        datePicker.layer.cornerRadius = 10
        datePicker.layer.masksToBounds = true
        // textFields
        itemField.placeholder = "ex: apple"
        costField.placeholder = "ex: 100"
        // registerButton
        registerButton.layer.cornerRadius = 10
        // closeButton
        closeButton.layer.cornerRadius = 60 / 2
    }
    
    // registeration
    @IBAction func registerAction(_ sender: Any) {
    }
    
    // closeButton animation
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
