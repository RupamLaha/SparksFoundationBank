//
//  Transactions.swift
//  SparksFoundationBank
//
//  Created by RUPAM LAHA on 15/01/21.
//

import SwiftUI

struct Transactions: View {
    
//    var transaction = ["Rupam", "Prabal"]
    
//    ["30.30.2120", "Badger", "$ 1000.00"],["12.02.2020", "Prabal", "$ 2000.00"],["01.30.2120", "Rupam", "$ 100.00"]
    
    var body: some View {
            
            List() {
               
                TransactionCells(date: "20.12.2021", name: "Rupam", amount: "1000")
                    .padding(.top, 5)
                
                TransactionCells(date: "20.12.2021", name: "Rupam", amount: "1000")
                    .padding(.top, 5)
                
            }.navigationBarTitle("Transactions", displayMode: .inline)
    }
}

struct Transactions_Previews: PreviewProvider {
    static var previews: some View {
        Transactions()
    }
}
