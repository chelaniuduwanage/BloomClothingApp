//
//  TabBarView.swift
//  BloomClothingApp
//
//  Created by User on 2024-04-03.
//

import SwiftUI

struct TabBarView: View {
    
    @StateObject var cartManager = CartManager()
    
    @State var currentTab: Tab = .Home
    
    
    init()
    {
        UITabBar.appearance().isHidden = true
    }
    
    @Namespace var animation
    var body: some View {
            TabView(selection: $currentTab)
            {
                    HomeView()
                Text("Notification")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(Tab.Notification)
                Text("Profile")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(Tab.Profile)
                
                NavigationView {
                                searchView()
                            }
                            .tag(Tab.Search)
                
                NavigationView {
                                FavouriteView()
                            }
                            .tag(Tab.Favourite)
                
            }.overlay(
                
                HStack(spacing: 0){
                    ForEach(Tab.allCases, id: \.rawValue){tab in
                        TabButton(tab:tab)
                    }.padding(.vertical)
                        .padding(.bottom, getSafeArea().bottom==0 ? 5 :(getSafeArea().bottom - 15))
                        .background(Color(red: 242/255, green: 157/255, blue: 154/255))
                }
                ,alignment: .bottom
            ).ignoresSafeArea(.all, edges: .bottom)
        }
        
        func TabButton(tab: Tab)-> some View{
            GeometryReader{proxy in Button (action: {
                withAnimation(.spring()){
                    currentTab = tab
                }
                
            },label: {
                VStack(spacing: 0){
                    
                    Image(systemName: currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue)
                        .resizable()
                        .foregroundColor(.white)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .frame(maxWidth:.infinity)
                        .background(
                            ZStack{
                                
                                if currentTab == tab {
                                    MaterialEffect(style:.light)
                                        .clipShape(Circle())
                                        .matchedGeometryEffect(id: "Tab", in: animation)
                                    
                                    Text(tab.Tabname)
                                        .padding(.top, 50)
                                }
                            }
                        ).contentShape(Rectangle())
                        .offset(y:currentTab == tab ? -15 : 0)
                }
            })
                
            }.frame(height: 25)
        }
        
        
        struct TabBarView_Previews: PreviewProvider {
            static var previews: some View {
                TabBarView().environmentObject(CartManager())
            }
        }
    }
    
    enum Tab:String, CaseIterable{
        case Search = "magnifyingglass"
        case Notification = "bell"
        case Home = "house"
        case Favourite = "heart"
        case Profile = "person"
        
        
        var Tabname: String{
            switch self{
            case.Search:
                return ""
                
            case.Notification:
                return ""
                
            case.Home:
                return ""
                
            case.Favourite:
                return ""
                
            case.Profile:
                return ""
            }
        }
    }
    
    extension View {
        func getSafeArea() -> UIEdgeInsets{
            guard let screen = UIApplication.shared.connectedScenes.first as?
                    UIWindowScene else{
                return .zero
            }
            guard let safeArea = screen.windows.first?.safeAreaInsets else {
                return.zero
            }
            return safeArea
        }
    }
    
    struct MaterialEffect: UIViewRepresentable {
        var style : UIBlurEffect.Style
        
        func makeUIView(context: Context) -> UIVisualEffectView {
            let view = UIVisualEffectView(effect: UIBlurEffect(style:style ))
            
            return view
        }
        
        func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
            
        }
    }



struct HomeView: View {
    
    @StateObject var cartManager = CartManager()
    
    @State private var selectedIndex: Int = 0
      
      private let categories = ["All", "Newly", "Pants", "Dress", "Tops", "others"]
    
    var filteredProducts: [Product] {
            if selectedIndex == 0 {
                // Show all products
                return productList
            } else {
                // Filter products based on the selected category
                let category = categories[selectedIndex]
                return productList.filter { $0.category == category }
            }
        }
        
    
    var body: some View {
        NavigationView{
            ZStack {
                Image("WhatsApp Image 2024-03-24 at 23.40.21")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width:393 ,height:300)
                    .position(x:196.5, y:50)
                
                
                VStack{
                    
                    NavigationLink
                    {
                        
                        MycartView().environmentObject(cartManager)
                    }
                label:
                    {
                        CartButton(numberOfProducts: cartManager.products.count)
                    }.foregroundColor(.black).offset(x:150, y:-170)
                    
                    
                    Image(systemName:"contextualmenu.and.cursorarrow")    .resizable()
                        .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255))             .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width:20 ,height:20)
                        .offset(x:-160, y:-200)
                    
                    
                    Text("WELCOME,")
                        .font(.custom("AmericanTypewriter", size: 34))
                        .foregroundColor(Color.black)
                        .frame(width: 308, height: 115)
                        .offset(x:-80, y: -200)
                    
                    Text("Bloom")
                        .font(.custom("AmericanTypewriter", size: 34))
                        .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255)).bold()
                        .frame(width: 308, height: 12)
                        .offset(x:-115, y: -225)
                    VStack {
                                            ScrollView (.horizontal, showsIndicators: false) {
                                                HStack {
                                                    ForEach(0 ..< categories.count) { i in
                                                        Button(action: { selectedIndex = i }) {
                                                            CategoryView(isActive: selectedIndex == i, text: categories[i])
                                                        }
                                                    }
                                                }
                                                .padding()
                                            }
                                        }
                                        .offset(y: -10)
                    
                    Button(action: {
                    }) {
                        Text("Shop Now")
                            .font(.custom("Mongolian Baiti", size: 15))
                            .foregroundColor(Color.white)
                            .frame(width: 120
                                   , height:45)
                            .background(Color(red: 242/255, green: 157/255, blue: 154/255))
                            .cornerRadius(30)
                            .padding(15)
                            .shadow(radius: 25)
                    }.offset(x:115, y:-360)
                    
                    
                    
                }
                
                VStack
                {
                    ImageSwapView().offset(y:-50)
                    
                }.offset(y:-30)
                
                VStack{
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing:15) {
                            ForEach(filteredProducts, id: \.id) { product in
                                ProductCardView(product: product)
                                    .environmentObject(cartManager)
                            }
                        }
                        
                    }
                }.offset(y:208)
                
            }
        }.navigationBarBackButtonHidden(true)
           
    }
}
#Preview {
    HomeView()
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    
    var body: some View {
        HStack(spacing: 4) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.bold)
                .foregroundColor(isActive ? Color.white : Color.white)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(isActive ? Color.pink : Color(red: 242/255, green: 157/255, blue:154/255))
                .shadow(radius: 20)
                .clipShape(Capsule())
            
            if isActive {
                Image(systemName: "checkmark")
                    .foregroundColor(.white)
            }
        }
        .padding(.trailing).offset(x:5)
    }
}

