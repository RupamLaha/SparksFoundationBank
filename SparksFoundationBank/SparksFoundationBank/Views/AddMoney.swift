//
//  AddMoney.swift
//  SparksFoundationBank
//
//  Created by RUPAM LAHA on 16/01/21.
//

import SwiftUI

struct AddMoney: View {
    
    
    @State var customersData:[customersModel] = DB_Manager().getUsers()
    @State var amount: String = ""
    @State private var showingAlert = false
    @State private var showPopUp = false
    
    // to go back to previous view
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        
        VStack{
            
            VStack{
                
                TextField("Enter amount", text: $amount)
                    .frame(height: 55)
                    .padding(.leading)
                    .padding(.trailing)
                    .textFieldStyle(PlainTextFieldStyle())
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                    .padding([.leading, .trailing], 24)
                
            }.padding(.top, 50)
            
            Button(action: {
                
                if (amount == ""){
                    
                    self.showingAlert = true
                    
                }else{
                    //get the available balance
//                    let availableBalance: Int64 = customersData[0].balance + Int64(amount)!
                    
                    //total balance to update
                    DB_Manager().addMoney(moneyValue: Int64(amount)!)
                    
                    //successful alert
                    self.showPopUp = true
                    amount = ""
                    
                    // go back to home page
//                    self.mode.wrappedValue.dismiss()
                }
                
            }, label: {
                Text("Add Money")
                    .bold()
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .frame(width: 300, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .cornerRadius(30)
            }).padding(.top, 20)
            .alert(isPresented: $showingAlert, content: {
                Alert(title: Text("Opps!"), message: Text("Add amount."), dismissButton: .cancel())
            })
            .alert(isPresented: $showPopUp, content: {
                Alert(title: Text("Hurry!"), message: Text("Transaction Successful"), dismissButton: .cancel())
            })
            
            Button(action: {
                
                // go back to home page
                self.mode.wrappedValue.dismiss()
                
            }, label: {
                Text("Cancel")
                    .bold()
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .frame(width: 300, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.gray)
                    .cornerRadius(30)
                
            }).padding(.top, 5)
            
            Spacer()
        }
        
    }
}

struct AddMoney_Previews: PreviewProvider {
    static var previews: some View {
        AddMoney()
    }
}
