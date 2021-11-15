//
//  AddViewController.swift
//  DisbursementConfirmationApp
//
//  Created by mizoz on 2021/11/14.
//

import UIKit
import RealmSwift
import PKHUD

class AddViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var itemField: UITextField!
    @IBOutlet weak var costField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // datePicker
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
        
        // Detects when the keyboard is displayed / hidden
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    // keyboard is displayed
    @objc private func keyboardWillShow(sender: NSNotification) {
        if itemField.isFirstResponder {
            guard let userInfo = sender.userInfo else { return }
            let duration: Float = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).floatValue
            UIView.animate(withDuration: TimeInterval(duration), animations: { () -> Void in
                let transform = CGAffineTransform(translationX: 0, y: -150)
                self.view.transform = transform
            })
        }
        if costField.isFirstResponder {
            guard let userInfo = sender.userInfo else { return }
            let duration: Float = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).floatValue
            UIView.animate(withDuration: TimeInterval(duration), animations: { () -> Void in
                let transform = CGAffineTransform(translationX: 0, y: -150)
                self.view.transform = transform
            })
        }
    }
    
    // keyboard is closed
    @objc private func keyboardWillHide(sender: NSNotification) {
        guard let userInfo = sender.userInfo else { return }
        let duration: Float = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).floatValue
        UIView.animate(withDuration: TimeInterval(duration), animations: { () -> Void in
            self.view.transform = CGAffineTransform.identity
        })
    }
    
    // Tap screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // registeration
    @IBAction func registerAction(_ sender: Any) {
        // Date formatting
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        // Save to Realm
        let payment = Payment()
        payment.date = "\(formatter.string(from: datePicker.date))"
        payment.item = itemField.text!
        payment.cost = Int(costField.text!)!
        try! realm.write {
            realm.add(payment)
        }
        
        itemField.text = ""
        costField.text = ""
        self.view.endEditing(true)
        
        // Success animation
        HUD.flash(.success, delay: 1.0)
    }
    
    // closeButton animation
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
