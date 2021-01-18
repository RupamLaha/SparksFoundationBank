//
//  ContentView.swift
//  SparksFoundationBank
//
//  Created by RUPAM LAHA on 15/01/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var customersData:[customersModel] = DB_Manager().getUsers()
    @State private var sendMoney = false
    @State private var addMoney = false
    @State private var showingAlert = false
    @State var currentBalance:Int64 = 0
    @State var accountNo:Int64 = 0
    
    
    var body: some View {
        
        NavigationView{
            VStack{
                HStack{
                    Image("profile")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.leading)
                        .navigationBarTitle("", displayMode: .inline)
                        .navigationBarHidden(true)
                    //                        .overlay(Circle().stroke(Color.red, lineWidth: 2))
                    VStack{
                        
                        HStack{
                            Text(customersData[0].name)
                                .bold()
                                .font(.system(size: 14))
                            Spacer()
                        }
                        HStack{
                            Text(customersData[0].email)
                                .font(.system(size: 13))
                                .fontWeight(.light)
                                .foregroundColor(Color.gray)
                            Spacer()
                        }
                    }
                }
                
                Button(action: {
                    self.showingAlert = true
                    
                    let customersData:[customersModel] = DB_Manager().getUsers()
                    self.currentBalance = customersData[0].balance
                    self.accountNo = customersData[0].acc_no
                    
                }, label: {
                    Text("View Balance")
                        .bold()
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .frame(width: 340, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.blue)
                        .cornerRadius(30)
                })
                .alert(isPresented: $showingAlert, content: {
                    
                    Alert(title: Text("$ " + String(currentBalance)), message: Text("Current Balance \n Account No. - " + String(accountNo)), dismissButton: .cancel())
                })
                
                //                ZStack{
                //
                //                    Rectangle()
                //                        .frame(width: 340, height: 106, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                //                        .cornerRadius(15)
                //                        //                    .foregroundColor(Color(UIColor(red: 0, green: 133, blue: 255, alpha: 1.0)))
                //                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                //
                //                    VStack{
                //                        HStack{
                //                            Text("Account No.")
                //                                .font(.system(size: 12))
                //                                .padding(.leading, 35)
                //                                .foregroundColor(.black)
                //                            //                            .padding(.top, -5)
                //                            Spacer()
                //                        }
                //
                //                        HStack{
                //
                //                            Text(String(customersData[0].acc_no))
                //                                .bold()
                //                                .font(.system(size: 14))
                //                                .padding(.leading, 35)
                //                                .padding(.top, -5)
                //                                .foregroundColor(.white)
                //                            Spacer()
                //                        }
                //
                //                        HStack{
                //                            Text("Remaining Balance")
                //                                .font(.system(size: 12))
                //                                .padding(.leading, 35)
                //                                .padding(.top, -5)
                //                                .foregroundColor(.black)
                //                            Spacer()
                //                        }
                //
                //                        HStack{
                //
                //                            Text("$ " + String(Double(customersData[0].balance)) )
                //                                .bold()
                //                                .font(.system(size: 18))
                //                                .padding(.leading, 35)
                //                                .padding(.top, -5)
                //                                .foregroundColor(.white)
                //                            Spacer()
                //                        }
                //                    }
                //                }
                
                VStack{
                    HStack{
                        
                        NavigationLink(
                            destination: Transactions()){
                            SubTaskViews(borderColor: Color.blue, text: "Transactions", image: "transactions")
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            
                            self.sendMoney.toggle()
                            
                        }, label: {
                            SubTaskViews(borderColor: Color.blue, text: "Send Money", image: "send")
                            //                        .padding(.trailing, 20)
                        }).sheet(isPresented: $sendMoney, content: {
                            SendMoney()
                        })
                        
                    }.padding(.bottom, 30)
                    
                    HStack{
                        
                        NavigationLink(
                            destination: Customers()){
                            SubTaskViews(borderColor: Color.blue, text: "All Customers", image: "customers")
                            //                        .padding(.leading, 20)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            
                            self.addMoney.toggle()
                            
                        }, label: {
                            SubTaskViews(borderColor: Color.blue, text: "Add Money", image: "add")
                            //                        .padding(.trailing, 20)
                        }).sheet(isPresented: $addMoney, content: {
                            AddMoney()
                        })
                        
                    }
                    
                }.padding(.all, 20)
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
