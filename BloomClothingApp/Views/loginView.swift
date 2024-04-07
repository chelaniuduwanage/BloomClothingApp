//
//  loginView.swift
//  BloomClothingApp
//
//  Created by User on 2024-04-03.
//

import SwiftUI

struct loginView: View {
    @State private var email: String = ""
    @State private var password: String = ""

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
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(radius: 15)
                .frame(width: 340, height: 55)
                .offset(x:-2,y:-100)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(radius: 15)
                .frame(width: 340, height: 60)
                .offset(x:-2,y:10)
            
            VStack
            {
                Text("Welcome Bloom")
                    .font(.custom("AmericanTypewriter", size: 40))
                                    .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255))
                                    .frame(width: 308, height: 132)
                                    .offset(y:-65)
                
                Text("Login to unlock exclusive deals and seamless")
                                .font(Font.custom("Skranji", size: 18))
                                .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255))
                                .frame(width: 364.3)
                                .offset(y: -230)
                
                Text("Shopping Experience")
                                .font(Font.custom("Skranji", size: 18))
                                .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255))
                                .frame(width: 364.3)
                                .offset(y: -220)
             
                VStack{
                    
                    
                    
                    TextField("cheluuduwana@gmail.com",text: $email)
                        .font(.custom("Inter", size: 20))
                        .foregroundColor(Color.gray)
                        .offset(x:90, y:-75)
                    
                    Image(systemName: "mail")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color.gray)
                        .offset(x:-135,y:-105)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                }
                TextField("...........",text: $password)
                                .font(.custom("Inter", size: 20))
                                .foregroundColor(Color.gray)
                                .offset(x:100, y:-25)

                            
                            Image(systemName: "lock")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color.gray)
                                .offset(x:-132, y:-60)

               
                Text("Remember me")
                                .font(Font.custom("Skranji", size: 12))
                                .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255))
                                .frame(width: 364.3)
                                .offset(x:-100, y: 20)
                
                Text("Forget Password ?")
                                .font(Font.custom("Skranji", size: 12))
                                .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255))
                                .frame(width: 364.3)
                                .offset(x:115,y: 5.5)
            
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
    loginView()
}
