//
//  Customers.swift
//  SparksFoundationBank
//
//  Created by RUPAM LAHA on 15/01/21.
//

import SwiftUI

struct Customers: View {
    var body: some View {
        
        List() {
           
            CustomersCells(name: "Prabal Shaw", email: "prabalshaw@gmail.com", acc: "123456789", money: "1000.00")
            
            CustomersCells(name: "Sudipta Saha", email: "sudiptasaha@gmail.com", acc: "09876532", money: "2000.00")
            
        }.navigationBarTitle("All Customers", displayMode: .inline)
    }
}

struct Customers_Previews: PreviewProvider {
    static var previews: some View {
        Customers()
    }
}
