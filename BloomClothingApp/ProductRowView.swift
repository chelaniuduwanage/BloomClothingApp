//
//  ProductRowView.swift
//  BloomApp
//
//  Created by User on 2024-03-28.
//

import SwiftUI

struct ProductRowView: View {
    @EnvironmentObject var cartManager: CartManager
      var product: Product
    var body: some View {
        
        HStack {
            
            Image(product.link1 ?? "")  
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(product.name ?? "Product Name")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text("Rs.\(product.price ?? 0)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 10)
            
            Spacer()
            
            Image(systemName: "trash")
                .foregroundColor(.red)
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                }
        }
                .padding(10)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal)
            }
        }



#Preview {
    ProductRowView(product: productList[0]).environmentObject(CartManager())
}
