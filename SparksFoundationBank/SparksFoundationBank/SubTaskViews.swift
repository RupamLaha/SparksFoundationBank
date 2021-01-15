//
//  SubTaskViews.swift
//  SparksFoundationBank
//
//  Created by RUPAM LAHA on 15/01/21.
//

import SwiftUI

struct SubTaskViews: View {
    
    var borderColor: Color
    
    var text: String
    
    var image: String
    
    var body: some View {
        
        ZStack{
            
            VStack{
                
                Image(image)
                    .resizable()
                    .frame(width: 152, height: 152, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: .fit)
                    .overlay(RoundedRectangle(cornerRadius: 12.0).stroke(borderColor, lineWidth: 2))
                
                Text(text)
                    .bold()
//                    .foregroundColor(.black)
//                    .padding(.top, -35)
//                    .font(.system(size: 11))
                
            }.frame(width: 152, height: 152, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
        }
    }
}

struct SubTaskViews_Previews: PreviewProvider {
    static var previews: some View {
        SubTaskViews(borderColor: Color.red, text: "Money", image: "customers")
    }
}
