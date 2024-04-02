//
//  SignUpView.swift
//  BloomClothingApp
//
//  Created by User on 2024-04-03.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        ZStack {
            Image("301101462_5117200571722084_6078220574943787059_n")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(width:393 ,height:900)
                .offset(x:-100,y:50)
                .blur(radius: 3)
            
            RoundedRectangle(cornerRadius: 30)
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.8), Color.white.opacity(0.78)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .blur(radius: 10)
            
            VStack
            {
                Text("Sign Up Bloom")
                    .font(.custom("AmericanTypewriter", size: 40))
                                    .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255))
                                    .frame(width: 308, height: 132)
                                    .offset(y:-95)
                
                Text("Sign Up now for exclusive deals and seamless")
                                .font(Font.custom("Skranji", size: 17))
                                .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255))
                                .frame(width: 364.3)
                                .offset(y: -250)
                
                Text("Shopping Experience")
                                .font(Font.custom("Skranji", size: 18))
                                .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255))
                                .frame(width: 364.3)
                                .offset(y: -250)
                Text("Name")
                                .font(.custom("Inter", size: 20))
                                .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255))
                                .offset(x:-80, y:-80)
                            
                            Image(systemName: "")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255))
                                .offset(x:-135)
                Text("Email")
                                .font(.custom("Inter", size: 20))
                                .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255))
                                .offset(x:-80, y:-80)
                            
                            Image(systemName: "mail")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255))
                                .offset(x:-135)
                
                Text("Phone Number")
                                .font(.custom("Inter", size: 20))
                                .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255))
                                .offset(x:-80, y:-80)
                            
                            Image(systemName: "mail")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255))
                                .offset(x:-135)
                
                Text("Password")
                                .font(.custom("Inter", size: 20))
                                .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255))
                                .offset(x:-60, y:-30)

                            
                            Image(systemName: "lock")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255))
                                .offset(x:-132, y:-175)

                Text("Remember me")
                                .font(Font.custom("Skranji", size: 12))
                                .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255))
                                .frame(width: 364.3)
                                .offset(x:-100, y: 20)
    
            
                Text("New member ?  Register Now")
                                .font(Font.custom("Skranji", size: 12))
                                .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255))
                                .frame(width: 364.3)
                                .offset(y:170)
                
                
                            Button(action: {
                            }) {
                                Text("login")
                                    .font(.custom("Mongolian Baiti", size: 27))
                                    .foregroundColor(Color.white)
                                    .frame(width: 288
                                        , height:60
                                    )
                                    .background(Color(red: 242/255, green: 157/255, blue: 154/255))
                                    .cornerRadius(40
                                    )
                                    .padding(15)
                                    .shadow(radius: 25)
                            }.offset(y:50)
            
            }
        }
            
    }
}

#Preview {
    SignUpView()
}
