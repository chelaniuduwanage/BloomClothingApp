//
//  SuccessMsgView.swift
//  BloomClothingApp
//
//  Created by User on 2024-04-03.
//

import SwiftUI

struct SuccessMsgView: View {
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        NavigationView{
            ZStack
            {
                Image("Optimized-positive-woman-red-beret-trendy-blouse-smiles-holds-bags-from-clothing-stores-1024x683")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width:393 ,height:852)
                    .blur(radius: 5)
                
                
                VStack
                
                {
                    
                    Text("CONGRATULATIONS..!")
                        .font(.custom("AmericanTypewriter", size: 25))
                        .foregroundColor(Color.pink).bold()
                        .frame(width: 308, height: 115)
                        .offset(x:10,y: 150)
                    
                    
                    Text("You're order placed successfully")
                        .font(.custom("AmericanTypewriter", size: 18))
                        .foregroundColor(Color.black)
                        .frame(width: 308, height: 115)
                        .offset(y:70).bold()
                    
                    NavigationLink(destination: MycartView())
                    {
                        Text("Continue Shopping")
                        
                    }.offset(y:120).bold().foregroundColor(.white)
                    
                    Text("OR")
                        .font(.custom("AmericanTypewriter", size: 20))
                        .foregroundColor(Color.white)
                        .frame(width: 308, height: 115)
                        .offset(y:90)
                    
                    NavigationLink(destination: TabBarView())
                    {
                        Text("Back to Home")
                        
                    }.offset(y:50).bold().foregroundColor(.white)
                    
                    
                    Button(action: {
                    }) {
                        Text("Track Order")
                            .font(.custom("Mongolian Baiti", size: 20))
                            .foregroundColor(Color.white)
                            .frame(width: 190
                                   , height:60
                            )
                            .background(Color(red: 242/255, green: 157/255, blue: 154/255))
                            .cornerRadius(15)
                            .padding(15)
                            .shadow(radius: 25)
                    }.offset(y:-170)
                    
                }
            }
            
            
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SuccessMsgView().environmentObject(CartManager())
}
