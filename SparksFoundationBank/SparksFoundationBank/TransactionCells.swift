//
//  TransactionCells.swift
//  SparksFoundationBank
//
//  Created by RUPAM LAHA on 15/01/21.
//

import SwiftUI

struct TransactionCells: View {
    
    var date: String
    var name: String
    var amount: String
    var mode: String
    
    var body: some View {
        
        VStack{
            
            HStack{
                Text(date)
                    .font(.system(size: 15))
                Spacer()
            }
            
            HStack{
                if(mode == "credit"){
                    Text("From : " + name)
                        .font(.system(size: 18))
                }else{
                    Text("To : " + name)
                        .font(.system(size: 18))
                }
                
                Spacer()
                
                if(mode == "credit"){
                    Text("+ $ " + amount)
                        .bold()
                        .font(.system(size: 18))
                        .foregroundColor(.green)
                }else{
                    Text("- $ " + amount)
                        .bold()
                        .font(.system(size: 18))
                        .foregroundColor(.red)

                }
                
            }.padding(.top, 1)
        }
        
    }
}

struct TransactionCells_Previews: PreviewProvider {
    static var previews: some View {
        TransactionCells(date: "20.20.2021", name: "Rupam", amount: "1000.00", mode: "credit")
    }
}
