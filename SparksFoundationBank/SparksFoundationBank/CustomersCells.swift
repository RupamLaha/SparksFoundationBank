//
//  CustomersCells.swift
//  SparksFoundationBank
//
//  Created by RUPAM LAHA on 15/01/21.
//

import SwiftUI

struct CustomersCells: View {
    var name: String
    var email: String
    var acc: String
    var money: String
    
    var body: some View {
        
        HStack{
            
            VStack(alignment: .leading){
                Text(name)
                    .bold()
                    .font(.system(size: 18))
                Text(email)
                    .font(.system(size: 12))
                Text("Acc No. " + acc)
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text("$ " + money)
        }.padding(.top, 8)
    }
}

struct CustomersCells_Previews: PreviewProvider {
    static var previews: some View {
        CustomersCells(name: "Prabal Shaw", email: "prabalshaw@gmail.com", acc: "123456789", money: "1000.00")
    }
}
