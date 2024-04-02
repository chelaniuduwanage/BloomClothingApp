//
//  searchView.swift
//  BloomClothingApp
//
//  Created by User on 2024-04-03.
//

import SwiftUI

struct searchView: View {
    private var listOfProducts = productList
    @State var searchText = ""
    
    var rows = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView {
                    LazyVGrid(columns: rows, spacing: 20) {
                        ForEach(filteredProducts) { product in
                            NavigationLink(destination: ProducteDetailsView(product: product)) {
                                ProductCardView(product: product)
                            }
                        }
                    }
                    .padding()
                    .searchable(text: $searchText)
                    .navigationTitle("All Products")
                }
                
                var filteredProducts: [Product] {
                    if searchText.isEmpty {
                        return productList
                    } else {
                        return productList.filter { product in
                            let nameMatch = product.name.localizedCaseInsensitiveContains(searchText)
                            let categoryMatch = product.category.localizedCaseInsensitiveContains(searchText)
                            let colorMatch = product.color.localizedCaseInsensitiveContains(searchText)
                            let sizeMatch = product.itemSize.localizedCaseInsensitiveContains(searchText)
                            let priceMatch = "\(product.price)".localizedCaseInsensitiveContains(searchText)
                            
                            return nameMatch || categoryMatch || colorMatch || sizeMatch || priceMatch
                        }
                    }
                    
                }
                
                
            }
        }
    }
}

#Preview {
    
    searchView()
}
