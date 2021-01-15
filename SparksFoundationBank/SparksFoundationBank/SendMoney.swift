//
//  SendMoney.swift
//  SparksFoundationBank
//
//  Created by RUPAM LAHA on 15/01/21.
//

import SwiftUI

struct SendMoney: View {
    
    @State var account: String = ""
    @State var amount: String = ""
    
    var body: some View {
        
        VStack{
            
            VStack{
                
                TextField("Enter account no. / email", text: $account)
                    .frame(height: 55)
                    .padding(.leading)
                    .padding(.trailing)
                    .textFieldStyle(PlainTextFieldStyle())
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                    .padding([.leading, .trailing], 24)
                
                TextField("Enter amount", text: $amount)
                    .frame(height: 55)
                    .padding(.leading)
                    .padding(.trailing)
                    .textFieldStyle(PlainTextFieldStyle())
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                    .padding([.leading, .trailing], 24)
                
            }.padding(.top, 50)
            
            Button(action: {}, label: {
                Text("Send Money")
                    .bold()
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .frame(width: 300, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .cornerRadius(30)
            }).padding(.top, 20)
            
            Spacer()
        }
    }
}

struct SendMoney_Previews: PreviewProvider {
    static var previews: some View {
        SendMoney()
    }
}
