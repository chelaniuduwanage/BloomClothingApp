//
//  ModelItem.swift
//  BloomApp
//
//  Created by User on 2024-03-27.
//

import Foundation

//struct ItemModel: Decodable, Identifiable {
//    let id: Int?
//    let name: String?
//    let category: String?
//    let link1: String?
//    let link2: String?
//    let link3: String?
//    let description: String?
//    let color: String?
//    let itemSize: String?
//    let price: Decimal?
//    
//    enum CodingKeys: String, CodingKey {
//        case id = "Id"
//        case name = "Name"
//        case category = "Category"
//        case link1 = "Link1"
//        case link2 = "Link2"
//        case link3 = "Link3"
//        case description = "Description"
//        case color = "Color"
//        case itemSize = "ItemSize"
//        case price = "Price"
//    }
//}
//
//struct ItemResponseResult: Decodable {
//    let response: ItemModel?
//}
//
//struct ItemListResponseResult: Decodable {
//    let response: [ItemModel]?
//}
//
//struct MockItemModel {
//    let id: Int?
//    let name: String?
//    let link1: String?
////    let link2: String?
////    let description: String?
////    let itemSize: String?
////    // Add other properties as needed
//}
//
//let mockItems: [MockItemModel] = [
//    MockItemModel(id: 1, name: "Mock Item 1", link1: "Category A"),
//    MockItemModel(id: 2, name: "Mock Item 2", link1: "Category B"),
//    MockItemModel(id: 3, name: "Mock Item 3", link1: "Category A"),
//]


struct Product : Identifiable {
    var id = UUID()
      var name: String?
     var category: String?
     var link1: String?
     var link2: String?
     var link3: String?
    var description: String?
     var color: String?
    var itemSize: String?
    var price: Int
}

let productList = [
    Product(name: "Mini Dress Pink", category: "All", link1: "WhatsApp Image 2024-03-25 at 18.04.21", link2: "", link3: "", description: "Mock Description 1", color: "Mock Color 1", itemSize: "Mock Size 1", price: 5000),
    Product(name: "Mock Item 2", category: "Pants", link1: "WhatsApp Image 2024-03-24 at 23.40.21", link2: "", link3: "", description: "One of the primary functions of clothing is to protect the body from environmental elements such as weather, temperature extremes, and physical harm. Clothing acts as a barrier between the body and potentially harmful agents.", color: "Mock Color 2", itemSize: "Mock Size 2", price: 2800),
    
    Product(name: "Mock Item 2", category: "Dress", link1: "WhatsApp Image 2024-03-25 at 18.04.21 (2)", link2: "", link3: "", description: "Mock Description 2", color: "Mock Color 2", itemSize: "Mock Size 2", price: 200),
    
    Product(name: "Mock Item 2", category: "Tops", link1: "WhatsApp Image 2024-03-24 at 23.40.21", link2: "", link3: "", description: "Mock Description 2", color: "Mock Color 2", itemSize: "Mock Size 2", price: 200)
    
]
