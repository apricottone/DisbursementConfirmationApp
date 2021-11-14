//
//  ConfirmationViewController.swift
//  DisbursementConfirmationApp
//
//  Created by mizoz on 2021/11/14.
//

import UIKit

class ConfirmationViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ConfirmationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
//        cell.backgroundColor = .systemGray
        return cell
    }
    
    
}
