//
//  ProductDetailView.swift
//  BloomClothingApp
//
//  Created by Chelani Hansika on 2024-04-07.
//

import SwiftUI

struct ProductDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var product : Product
    @State private var selectedImageIndex: Int = 0
        private let imageLinks = ["241337061_4057855320989953_1545238218811069121_n", "WhatsApp Image 2024-03-24 at 23.40.21", "WhatsApp Image 2024-03-24 at 23.40.21"]
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            Color.white
            ScrollView  {
                Image(imageLinks[selectedImageIndex])
                                  .resizable()
                                  .aspectRatio(contentMode: .fit)
                                  .edgesIgnoringSafeArea(.top)
                                  .frame(maxWidth: .infinity, maxHeight: .infinity)
                                  .onTapGesture {
                                      selectedImageIndex = 0
                                  }
                
                HStack(spacing: 0) {
                    ForEach(0..<imageLinks.count, id: \.self) { index in
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 90, height: 60)
                            .overlay(
                                Image(imageLinks[index])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .clipped()
                                    .onTapGesture {
                                        selectedImageIndex = index
                                    }
                            )
                    }
                }.offset(y:-30)
                    
                DescriptionView(product: product)
                
                
            }
            .edgesIgnoringSafeArea(.top)
        
        }
        .navigationBarBackButtonHidden(true)
        
    }
}


struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: productList[2]).environmentObject(CartManager())
    
    }
}


struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct DescriptionView: View {
    var product :  Product
    let availableSizes = ["S", "M", "L", "XL"]
        @State private var selectedSize: String?
    @State private var quantity: Int = 1

    var body: some View {
        VStack (alignment: .leading) {
            HStack{
                Text(product.name ?? "")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()

                Text("$1299")
                    .font(.title)
                    .foregroundColor(.black)
            }
            
            Text("Product Details")
                .font(.custom("AmericanTypewriter", size: 20))
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text(product.description ?? "")
                .lineSpacing(8.0)
                .opacity(0.6)
            
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    Text("Available Sizes")
                        .font(.custom("AmericanTypewriter", size: 20))
                        .fontWeight(.semibold)
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
                    .offset(x:-15,y:-10)
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding(.vertical)
            
        
            HStack {
                
                
                VStack (alignment: .leading) {
                    Text("Colors")
                        .font(.custom("AmericanTypewriter", size: 20))
                        .fontWeight(.semibold)
                    HStack {
                        ColorDotView(color: Color.pink)
                        ColorDotView(color: Color.yellow)
                        ColorDotView(color: Color.green)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .offset(y:-30)
                
                HStack {
                          Button(action: {
                              if quantity > 1 {
                                  quantity -= 1
                              }
                          }) {
                              Image(systemName: "minus")
                                  .padding(.all, 8)
                          }
                          .frame(width: 30, height: 30)
                          .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                          .foregroundColor(.white)
                          .background(Color.pink)
                          .clipShape(Circle())


                          Text("\(quantity)")
                              .font(.title2)
                              .fontWeight(.semibold)
                              .foregroundColor(.pink)
                              .padding(.horizontal, 8)

                          Button(action: {
                              quantity += 1
                          }) {
                              Image(systemName: "plus")
                                  .foregroundColor(.white)
                                  .padding(.all, 8)
                                  .background(Color.pink)
                                  .clipShape(Circle())
                          }
                      }
                .padding().offset(y:-15)
            }
            
        }
        .padding()
        .padding(.top)
        .background(Color.white)
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .offset(x: 0, y: -30.0)
    }
}


