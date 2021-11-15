//
//  PaymentData.swift
//  DisbursementConfirmationApp
//
//  Created by mizoz on 2021/11/14.
//

import Foundation
import RealmSwift

class Payment: Object {
    @objc dynamic var date = ""
    @objc dynamic var item = ""
    @objc dynamic var cost = 0
}
