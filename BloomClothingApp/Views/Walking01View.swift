//
//  Walking01View.swift
//  BloomClothingApp
//
//  Created by User on 2024-04-03.
//

import SwiftUI

struct Walking01View: View {
//    @EnvironmentObject var cartManager : CartManager
    var body: some View {
        NavigationView{
            
            ZStack{
            
                Image("301101462_5117200571722084_6078220574943787059_n")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width:393 ,height:900)
                    .offset(x:-100,y:50)
                
                VStack{
                    
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.38), Color.white.opacity(0.71)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .frame(width: 200, height: 852)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .blur(radius: 8)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous)).offset(x:-100, y:-12)
                    
                }
                VStack
                {
                    
                    Text("Now with an exclusive 20% discount !")
                        .font(Font.custom("Skranji", size: 30))
                        .foregroundColor(Color.white).bold()
                        .frame(width: 300)
                        .lineSpacing(5)
                        .offset(y:-60)
                
                }
                
                VStack
                {
                    HStack{
                        
                        NavigationLink(destination: WelcomeView())
                        {
                            Image(systemName:"arrowshape.backward.circle.fill")
                        }.foregroundColor(.white).frame(width: 200, height: 300).offset(x:-50, y: 320)
                             
                                                
                        NavigationLink(destination: TabBarView())
                        {
                            Image(systemName:"arrowshape.right.circle.fill")
                        }.foregroundColor(.white).frame(width: 200, height: 300).offset(x:50, y:320)
                                                
                       
                    }
                    
                    
                }
            }
        }.navigationBarBackButtonHidden(true)
        
            }
}
#Preview {
    Walking01View()
}



