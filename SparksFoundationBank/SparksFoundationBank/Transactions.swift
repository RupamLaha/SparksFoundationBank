//
//  Transactions.swift
//  SparksFoundationBank
//
//  Created by RUPAM LAHA on 15/01/21.
//

import SwiftUI

struct Transactions: View {
    
    @State var allTransactions:[transactionsModel] = []
    
    var body: some View {
            
            List(allTransactions) { (transation) in
               
                TransactionCells(date: transation.tarik, name: transation.beneficiary, amount: String(transation.amount), mode: transation.mode)
                    .padding(.top, 5)
                
//                TransactionCells(date: "20.12.2021", name: "Rupam", amount: "1000")
//                    .padding(.top, 5)
                
            }.navigationBarTitle("Transactions", displayMode: .inline)
            .onAppear(perform: {
                self.allTransactions = DB_Manager().getTransactions()
            })
    }
}

struct Transactions_Previews: PreviewProvider {
    static var previews: some View {
        Transactions()
    }
}
