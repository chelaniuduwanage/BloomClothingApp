//
//  CheckoutView.swift
//  BloomClothingApp
//
//  Created by User on 2024-04-03.
//

import SwiftUI

struct CheckoutView: View {
    @State private var search: String = ""

    var body: some View {
        
        ZStack
        {
            
            Text("My CHECKOUT")
                .font(.custom("AmericanTypewriter", size: 25))
                .foregroundColor(Color(red: 187/255, green: 138/255, blue: 82/255)).bold()
                .frame(width: 308, height: 115)
                .offset(y: -320)
            
            
            VStack{
                
                Text("Paymemt Method")
                    .font(.custom("AmericanTypewriter", size: 20))
                    .foregroundColor(Color.black)
                    .frame(width: 308, height: 115)
                    .offset(y: -100)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .shadow(radius: 15)
                    .frame(width: 340, height: 140)
                    .offset(x:-10,y:-130)
                
                
                HStack{
                    Image(systemName:"plus")
                        .resizable()
                        .foregroundColor(.gray)
                        .scaledToFill()
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .frame(width:20 ,height:20)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                    
                    TextField("Add your address", text:$search).font(.custom("AmericanTypewriter", size: 20))
                        .foregroundColor(Color.gray)
                }.offset(x:35,y:-225).padding(.horizontal,10)
                
                
                Text("Order Details")
                    .font(.custom("AmericanTypewriter", size:20))
                    .foregroundColor(Color.black)
                    .frame(width: 308, height: 115)
                    .offset(x:-98,y:-130)
                
                
                Text ("Another Payment Method??")
                    .offset(y:-260)
            }
            
            VStack
            {
                Spacer()
                
                HStack{
                    
                    Text("Total Amount").font(.custom("AmericanTypewriter", size: 20))
                        .foregroundColor(Color.gray)
                        .offset(x:-50, y:-300)
                    
                    Text("Rs.2000").font(.custom("AmericanTypewriter", size: 20))
                        .foregroundColor(Color.gray)
                        .offset(x:50, y:-300)
                    
                    
                }.offset(y:120)
                
                
                NavigationLink(destination: SuccessMsgView())
                {
                    Text("Pay")
                    
                } .font(.custom("Mongolian Baiti", size: 22))
                    .foregroundColor(Color.white)
                    .frame(width: 100
                           , height:50
                    )
                    .background(Color(red: 187/255, green: 138/255, blue: 82/255))
                    .cornerRadius(30)
                    .padding(15)
                    .shadow(radius: 25)
                    .offset(y:-120)
                
            }
            
            
        }
        
    }
}

#Preview {
    CheckoutView()
}
