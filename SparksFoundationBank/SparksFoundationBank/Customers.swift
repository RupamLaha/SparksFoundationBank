//
//  Customers.swift
//  SparksFoundationBank
//
//  Created by RUPAM LAHA on 15/01/21.
//

import SwiftUI

struct Customers: View {
    
    @State var customersData:[customersModel] = []
    
    var body: some View {
        
        List(self.customersData) { (data) in
            
            CustomersCells(name: data.name, email: data.email, acc: data.acc_no, money: data.balance )
            
        }.navigationBarTitle("All Customers", displayMode: .inline)
        .onAppear(perform: {
            self.customersData = DB_Manager().getUsers()
        })
        
    }
}

struct Customers_Previews: PreviewProvider {
    static var previews: some View {
        Customers()
    }
}
