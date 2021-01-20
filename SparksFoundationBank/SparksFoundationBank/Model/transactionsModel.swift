//
//  transactionsModel.swift
//  SparksFoundationBank
//
//  Created by RUPAM LAHA on 18/01/21.
//

import Foundation

class transactionsModel: Identifiable{
    
    public var transaction_id: Int64 = 0
    public var tarik: String = ""
    public var customer_id: Int64 = 0
    public var mode: String = ""
    public var beneficiary: String = ""
    public var amount: Int64 = 0
    
}
