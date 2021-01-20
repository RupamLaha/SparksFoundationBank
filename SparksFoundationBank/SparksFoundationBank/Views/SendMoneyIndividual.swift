//
//  SendMoneyIndividual.swift
//  SparksFoundationBank
//
//  Created by RUPAM LAHA on 20/01/21.
//

import SwiftUI

struct SendMoneyIndividual: View {
    
    var name: String
    var account: Int64
    @State var customersData:[customersModel] = DB_Manager().getUsers()
    @State private var amount: String = ""
    @State private var showingAlert = false
    @State private var showingInsufficientAlert = false
    @State private var showPopUp = false
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .lastTextBaseline){
                Text("To: ")
                    .padding(.leading, 20)
                    .font(.system(size: 25))
                Text(name)
                    .bold()
                    .font(.system(size: 30))
            }.navigationBarTitle("Send Money", displayMode: .inline)
            .padding(.top, 20)
            
            TextField("Enter amount", text: $amount)
                .frame(height: 55)
                .padding(.leading)
                .padding(.trailing)
                .textFieldStyle(PlainTextFieldStyle())
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                .padding([.leading, .trailing], 24)
            
            Button(action: {
                
                if (amount == ""){
                    
                    self.showingAlert = true
                    
                }else{
                    
                    if(customersData[0].balance < Int64(amount)!){
                        self.showingInsufficientAlert = true
                    }else{
                        //total balance to update
                        DB_Manager().sendMoney(accountNo: account, moneyValue: Int64(amount)!)
                        
                        //successful alert
                        self.showPopUp = true
                        
                        amount = ""
                        
                        // go back to home page
//                        self.mode.wrappedValue.dismiss()
                    }
                }
            }, label: {
                Text("Send Money")
                    .bold()
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .frame(width: 340, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .cornerRadius(30)
            }).padding()
            .alert(isPresented: $showingAlert, content: {
                Alert(title: Text("Opps!"), message: Text("Enter valid value."), dismissButton: .cancel())
            })
            .alert(isPresented: $showingInsufficientAlert, content: {
                Alert(title: Text("Opps!"), message: Text("Insufficient Balance"), dismissButton: .cancel())
            })
            .alert(isPresented: $showPopUp, content: {
                Alert(title: Text("Hurry!"), message: Text("Transaction Successful"), dismissButton: .cancel())
            })
            
            Spacer()
        }
        
        }
    }


struct SendMoneyIndividual_Previews: PreviewProvider {
    static var previews: some View {
        SendMoneyIndividual(name: "Rupam", account: 67890)
    }
}
