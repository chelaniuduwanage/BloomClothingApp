//
//  MycartView.swift
//  BloomClothingApp
//
//  Created by User on 2024-03-25.
//

import SwiftUI

struct MycartView: View {
    
    @EnvironmentObject var cartManager : CartManager

    var body: some View {
        ZStack
        {
            Text("MY CART")
                .font(.custom("AmericanTypewriter", size: 25))
                .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255)).bold()
                                .frame(width: 308, height: 115)
                                .offset(y: -375)
           
            ScrollView{
                
        
                if cartManager.products.count > 0 {
                    ForEach(cartManager.products , id: \.id){
                        product in
                        ProductRowView(product:product)
                    }
                    VStack
                    {
                        HStack{
                            Text("Gross Total")
                                .font(.custom("AmericanTypewriter", size: 20))
                                .foregroundColor(Color.black).bold()
                            
                            Spacer()
                            
                            Text("Rs.\(cartManager.total).00")
                                .bold()
                        }.padding(5)
                        
                        NavigationLink(destination: CheckoutView())
                        {
                            Text("Proceed to Checkout")
        
                        } .font(.custom("Mongolian Baiti", size: 22))
                            .foregroundColor(Color.white)
                            .frame(width: 270
                                , height:70
                            )
                            .background(Color(red: 242/255, green: 157/255, blue: 154/255))
                            .cornerRadius(15)
                            .padding(15)
                            .shadow(radius: 25)
                            .offset(y:30)
                       
                    }
                    
                }
                else {
                    
                    Image("4610092").resizable().scaledToFill().frame(width: 400, height:400).offset(y:100)
                    
                    
                    Text("Your cart is empty....")
                        .font(.custom("AmericanTypewriter", size: 20))
                        .foregroundColor(Color.black).bold()
                        .offset(y:100)
                }
                
            }
            .navigationTitle("")
            .padding(.top)
           
    }
}
}

#Preview {
    MycartView().environmentObject(CartManager())
}
