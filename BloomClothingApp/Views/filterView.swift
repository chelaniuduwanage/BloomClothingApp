//
//  filterView.swift
//  BloomClothingApp
//
//  Created by User on 2024-04-03.
//

import SwiftUI

struct filterView: View {
    @Binding var selectedCategory: String?
    @Binding var selectedColor: String?
    @Binding var selectedSize: String?
    @Binding var selectedPriceRange: ClosedRange<Int>?

    let categories = Set(productList.map { $0.category })
    let colors = Set(productList.map { $0.color })
    let sizes = Set(productList.map { $0.itemSize })
    let priceRangeOptions = [
        "0 - 1000",
        "1000 - 2000",
        "2000 - 3000",
        "3000 - 5000",
        "5000+"
    ]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Category")) {
                    Picker(selection: $selectedCategory, label: Text("Select Category")) {
                        ForEach(categories.sorted(), id: \.self) { category in
                            Text(category).tag(category)
                        }
                    }
                }

                Section(header: Text("Color")) {
                    Picker(selection: $selectedColor, label: Text("Select Color")) {
                        ForEach(colors.sorted(), id: \.self) { color in
                            Text(color).tag(color)
                        }
                    }
                }

                Section(header: Text("Size")) {
                    Picker(selection: $selectedSize, label: Text("Select Size")) {
                        ForEach(sizes.sorted(), id: \.self) { size in
                            Text(size).tag(size)
                        }
                    }
                }

                Section(header: Text("Price Range")) {
                    Picker(selection: $selectedPriceRange, label: Text("Select Price Range")) {
                        ForEach(priceRangeOptions, id: \.self) { priceRange in
                            Text(priceRange).tag(priceRange)
                        }
                    }
                }
            }
            .navigationTitle("Filters")
            .navigationBarItems(trailing: Button("Apply") {
                // Apply filters
            })
        }
    }
}

struct filterView_Previews: PreviewProvider {
    static var previews: some View {
        filterView(selectedCategory: .constant(nil), selectedColor: .constant(nil), selectedSize: .constant(nil), selectedPriceRange: .constant(nil))
    }
}
