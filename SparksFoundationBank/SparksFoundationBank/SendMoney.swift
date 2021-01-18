//
//  SendMoney.swift
//  SparksFoundationBank
//
//  Created by RUPAM LAHA on 15/01/21.
//

import SwiftUI

struct SendMoney: View {
    
    @State var customersData:[customersModel] = DB_Manager().getUsers()
    @State var account: String = ""
    @State var amount: String = ""
    @State private var showingAlert = false
    @State private var showingInsufficientAlert = false
    
    
    // to go back to previous view
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        
        VStack{
            
            VStack{
                
                TextField("Enter account no.", text: $account)
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
            
            Button(action: {
                
                if (amount == "" || account == ""){
                    
                    self.showingAlert = true
                    
                }else{
                    
                    if(customersData[0].balance < Int64(amount)!){
                        self.showingInsufficientAlert = true
                    }else{
                        //total balance to update
                        DB_Manager().sendMoney(accountNo: Int64(account)!, moneyValue: Int64(amount)!)
                        
                        // go back to home page
                        self.mode.wrappedValue.dismiss()
                    }
                }
                
                
            }, label: {
                Text("Send Money")
                    .bold()
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .frame(width: 300, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .cornerRadius(30)
            }).padding(.top, 20)
            .alert(isPresented: $showingAlert, content: {
                Alert(title: Text("Opps!"), message: Text("Enter valid value."), dismissButton: .cancel())
            })
            .alert(isPresented: $showingInsufficientAlert, content: {
                Alert(title: Text("Opps!"), message: Text("Insufficient Balance"), dismissButton: .cancel())
            })
            
            Spacer()
        }
    }
}

struct SendMoney_Previews: PreviewProvider {
    static var previews: some View {
        SendMoney()
    }
}
