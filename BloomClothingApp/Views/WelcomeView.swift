//
//  WelcomeView.swift
//  BloomClothingApp
//
//  Created by User on 2024-04-03.
//

import SwiftUI

struct WelcomeView: View {

    var body: some View {
        
        NavigationView{
            
            ZStack {
                Image("241337061_4057855320989953_1545238218811069121_n")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width:150 ,height:852).offset(x:-90,y:40)
                
                RoundedRectangle(cornerRadius: 100)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(1), Color.white.opacity(0.71)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 400, height: 390)
                    .shadow(radius: 20)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 100, style: .continuous)
                    ).offset(y:267)
                
                VStack
                {
                    Text("Bloom")
                        .font(.custom("AmericanTypewriter", size: 68))
                        .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255))
                        .frame(width: 308, height: 132)
                        .offset(y: 210)
                    
                    Text("Discover the latest trends in women fashion and explore your personality")
                        .font(Font.custom("Skranji", size: 17))
                        .foregroundColor(Color(red: 136/255, green: 136/255, blue: 136/255))
                        .frame(width: 288)
                        .offset(y: 195)
                    
                    
                    NavigationLink(destination: Walking01View())
                    {
                        Text("EXPLORE")
    
                    }.font(.custom("Mongolian Baiti", size: 27))
                        .foregroundColor(.white)
                        .frame(width: 288, height: 60)
                        .background(Color(red: 242/255, green: 157/255, blue: 154/255))
                        .cornerRadius(30)
                        .padding(15)
                        .shadow(radius:10)
                        .offset(y: 210)
                }
                
            }.padding(.horizontal, 15)
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    WelcomeView()

}
