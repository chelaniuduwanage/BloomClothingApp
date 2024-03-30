//
//  ImageSwapView.swift
//  BloomClothingApp
//
//  Created by User on 2024-03-30.
//

import SwiftUI

struct ImageSwapView: View {
    @State private var  currentIndex = 0
    var slides : [String] = ["Optimized-positive-woman-red-beret-trendy-blouse-smiles-holds-bags-from-clothing-stores-1024x683","WhatsApp Image 2024-03-24 at 23.40.21","portrait-excited-amazed-happy-blond-female-white-dress_1258-9289",]
    var body: some View {
        ZStack(alignment: .bottomLeading)
        {
            ZStack(alignment: .trailing)
            {
                Image(slides[currentIndex]).resizable()
                    .frame(width: .infinity,height: 130)
                    .scaledToFit()
                    .cornerRadius(15)
            }
            HStack{
                ForEach(0..<slides.count){index in
                    Circle()
                .fill(self.currentIndex == index ? Color("black") : Color("pink"))
                    .frame(width:30, height:30)
            }
            }.padding()
        }.padding()
            .onAppear{
                Timer.scheduledTimer(withTimeInterval: 5, repeats: true){
                    timer in
                    if self.currentIndex + 1 == self.slides.count{
                        self.currentIndex = 0
                    }
                    else {
                        self.currentIndex += 1
                    }
                }
            }
    }
}

#Preview {
    ImageSwapView()
}
