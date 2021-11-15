//
//  ConfirmationViewController.swift
//  DisbursementConfirmationApp
//
//  Created by mizoz on 2021/11/14.
//

import UIKit
import RealmSwift

class ConfirmationViewController: UIViewController {    
    @IBOutlet weak var tableView: UITableView!
    let cellId = "cellId"
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension ConfirmationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let paymentData = realm.objects(Payment.self)
        return paymentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        let paymentData = realm.objects(Payment.self)
        cell.textLabel!.text = "\(paymentData[indexPath.row].date)"
        cell.detailTextLabel!.text = "\(paymentData[indexPath.row].item)　¥\(paymentData[indexPath.row].cost)"
        return cell
    }
    
    // Delete selected cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        try! realm.write {
            let paymentData = realm.objects(Payment.self)
            let selectedCell = paymentData[indexPath.row]
            realm.delete(selectedCell)
        }
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
}
