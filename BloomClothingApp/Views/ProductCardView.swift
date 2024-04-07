//
//  ProductCardView.swift
//  BloomClothingApp
//
//  Created by User on 2024-04-03.
//

import SwiftUI

struct ProductCardView: View {
    @EnvironmentObject var cartManager: CartManager
    var product :Product
    var body: some View {
        ZStack(alignment: .topTrailing){
            ZStack(alignment: .bottom){
                Image(product.link1 ?? "")
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180,height: 220)
                    .scaledToFit()
                VStack(alignment: .leading){
                    Text(product.name ?? "")
                        .bold()
                    Text("Rs\(product.price)")
                        .font(.caption)
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            
            Button{
                cartManager.addToCart(product: product)
            }
        label: {
            Image(systemName:"plus.circle.fill")
                .resizable()
                .frame(width:20 ,height:20)
                .padding(.trailing)
            
        }
        .offset(x:5,y:180)
        .foregroundColor(.pink)
        }
            
        }
}


#Preview {
    ProductCardView(product: productList[1]).environmentObject(CartManager())
}
