//
//  ProducteDetailsView.swift
//  BloomClothingApp
//
//  Created by User on 2024-04-03.
//

import SwiftUI

struct ProducteDetailsView: View {
    var product :  Product
    let availableSizes = ["S", "M", "L", "XL"]
        @State private var selectedSize: String?
    var body: some View {
        ZStack{
            VStack{
                
                Image(product.link1 ?? "")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width:200 ,height:370)
                    .position(x:160,y:149)
                
                Image(systemName:"heart.circle.fill")
                    .resizable()
                    .foregroundColor(.red)
                    .scaledToFill()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width:33 ,height:30)
                    .offset(x:150, y:-720)
            
                    
            }
            Rectangle()
                .fill(Color.white)
                .frame(width:290,height: 70)
                .shadow(radius: 8)
                .offset(y:-40)
            
            VStack{
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 90,height: 60)
                    .offset(y:309)
                Image(product.link1 ?? "")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width:20 ,height:60)
                    .position(x:202.5,y:271)
                
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 90,height: 60)
                    .offset(x:95, y:53)
                Image(product.link1 ?? "")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width:20 ,height:60)
                    .position(x:298,y:15)
                
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 90,height: 60)
                    .offset(x:-96,y:-202)
                Image(product.link1 ?? "")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width:20 ,height:60)
                    .position(x:107,y:-240.5)
            }
            
            VStack{
                
                
                Text(product.name ?? "")
                    .font(.custom("AmericanTypewriter", size: 24))
                    .foregroundColor(Color.black)
                    .frame(height: 12).offset(x:-100, y:120)
                
                Text("$120")
                    .font(.custom("AmericanTypewriter", size: 20))
                    .foregroundColor(Color.black)
                    .frame(height: 12).offset(x:150, y:100)
                
                HStack{
                    Text("Available Size")
                        .font(.custom("AmericanTypewriter", size: 15))
                        .foregroundColor(Color.black)
                        .frame(height: 12).offset(x:-95, y:120)
                    
                    Text("Colors")
                        .font(.custom("AmericanTypewriter", size: 15))
                        .foregroundColor(Color.black)
                        .frame(height: 12).offset(x:100,y:120)
                }
                
                HStack{
                    
                    HStack {
                        ForEach(availableSizes, id: \.self) { size in
                            Button(action: {
                                selectedSize = size
                            }) {
                                Text(size)
                                    .padding(15)
                                    .background(selectedSize == size ? Color.pink : Color.white)
                                    .foregroundColor(selectedSize == size ? Color.white : Color.black)
                                    .overlay(
                                        Rectangle()
                                            .stroke(Color.white, lineWidth: 1)
                                    )
                                    .shadow(radius: 2)
                            }
                        }
                    }
                    .padding()
                    .offset(x:-70,y:120)
                                    
                }
                
                Text("Product Description")
                    .font(.custom("AmericanTypewriter", size: 15))
                    .foregroundColor(Color.black)
                    .frame(height: 12).offset(x:-99, y:120)
                
                
                Text(product.description ?? "")
                    .offset(x:-95,y:125)
                    .frame(width:400)
//
//                Button(action: {
//
//                }) {
//                    Text("Add To Cart")
//                        .font(.custom("Mongolian Baiti", size: 18))
//                        .foregroundColor(Color.white)
//                        .frame(width: 140
//                            , height:50
//                        )
//                        .background(Color(red: 242/255, green: 157/255, blue: 154/255))
//                        .cornerRadius(15
//                        )
//                        .padding(15)
//                        .shadow(radius: 25)
//                }.offset(x:100, y:320)
            }.padding(.horizontal, 2.5)
            
            
        }
    }
}

#Preview {
    ProducteDetailsView(product: productList[3])
}
