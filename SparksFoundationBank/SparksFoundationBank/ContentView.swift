//
//  ContentView.swift
//  SparksFoundationBank
//
//  Created by RUPAM LAHA on 15/01/21.
//

import SwiftUI

struct ContentView: View {
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
                            Text("Rupam Laha")
                                .bold()
                                .font(.system(size: 14))
                            Spacer()
                        }
                        HStack{
                            Text("rupamlaha@gmail.com")
                                .font(.system(size: 13))
                                .fontWeight(.light)
                                .foregroundColor(Color.gray)
                            Spacer()
                        }
                    }
                }
                
                ZStack{
                    
                    Rectangle()
                        .frame(width: 340, height: 106, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(15)
                        //                    .foregroundColor(Color(UIColor(red: 0, green: 133, blue: 255, alpha: 1.0)))
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    
                    VStack{
                        HStack{
                            Text("Account No.")
                                .font(.system(size: 12))
                                .padding(.leading, 35)
                                .foregroundColor(.black)
                            //                            .padding(.top, -5)
                            Spacer()
                        }
                        
                        HStack{
                            Text("14004001234")
                                .bold()
                                .font(.system(size: 14))
                                .padding(.leading, 35)
                                .padding(.top, -5)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        
                        HStack{
                            Text("Remaining Balance")
                                .font(.system(size: 12))
                                .padding(.leading, 35)
                                .padding(.top, -5)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        
                        HStack{
                            Text("$ 123,456,789.00")
                                .bold()
                                .font(.system(size: 18))
                                .padding(.leading, 35)
                                .padding(.top, -5)
                                .foregroundColor(.white)
                            Spacer()
                        }
                    }
                }
                
                VStack{
                    HStack{
                        
                        NavigationLink(
                            destination: Transactions()){
                            SubTaskViews(borderColor: Color.blue, text: "Transactions", image: "transactions")
                        }
                        
                        Spacer()
                        
                        SubTaskViews(borderColor: Color.blue, text: "Send Money", image: "send")
                        //                        .padding(.trailing, 20)
                    }.padding(.bottom, 30)
                    
                    HStack{
                        
                        NavigationLink(
                            destination: Customers()){
                            SubTaskViews(borderColor: Color.blue, text: "All Customers", image: "customers")
                            //                        .padding(.leading, 20)
                        }
                        
                        Spacer()
                        
                        SubTaskViews(borderColor: Color.blue, text: "Add Money", image: "add")
                        //                        .padding(.trailing, 20)
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
