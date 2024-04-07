//
//  ImageSwapView.swift
//  BloomClothingApp
//
//  Created by User on 2024-03-30.
//

import SwiftUI

struct ImageSwapView: View {
    @State private var  currentIndex = 0
    var slides : [String] = ["420151447_769056328598473_3257663368595089040_n","5_WOMENS_FASHION_BRANDS_TO_SHOP_AT_NOON_ylQkT4m_naInkvy_KPu2Hy9_fzFsgu4_lnUCEo9","main-qimg-1d7f544942b40742391ed0f85f5e4714-lq"]
    var body: some View {
        ZStack(alignment: .bottomLeading)
        {
            ZStack(alignment: .trailing)
            {
                Image(slides[currentIndex]).resizable()
                    .frame(width: .infinity,height: 160)
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
