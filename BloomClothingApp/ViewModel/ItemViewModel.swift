//
//  ItemViewModel.swift
//  BloomClothingApp
//
//  Created by Chelani hansika on 2024-04-07.
//

import Foundation

class ItemViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var selectedItem: Product?

    func fetchData() {
        guard let url = URL(string: "http://chelani2000-001-site1.itempurl.com/api/Item/SearchItems?nextPage=0&rowCount=10&MinPrice=1&MaxPrice=999999999&Name=&Category=&Color=&ItemSize=") else {
            fatalError("Invalid URL")
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("11168044", forHTTPHeaderField: "username")
        request.setValue("60-dayfreetrial", forHTTPHeaderField: "password")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode([Product].self, from: data)
                DispatchQueue.main.async {
                    self.products = decodedResponse
                }
            } catch {
                print("Error decoding response: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func fetchItemByID(id: Int) {
            guard let url = URL(string: "http://chelani2000-001-site1.itempurl.com/api/Item/GetItemByID?id=\(id)") else {
                fatalError("Invalid URL")
            }

            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("11168044", forHTTPHeaderField: "username")
            request.setValue("60-dayfreetrial", forHTTPHeaderField: "password")

            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }

                do {
                    let decodedResponse = try JSONDecoder().decode(Product.self, from: data)
                    DispatchQueue.main.async {
                        self.selectedItem = decodedResponse
                    }
                } catch {
                    print("Error decoding response: \(error.localizedDescription)")
                }
            }.resume()
        }
}
