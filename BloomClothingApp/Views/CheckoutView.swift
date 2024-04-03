import SwiftUI

struct CheckoutView: View {
    @State private var search: String = ""
    @State private var showAlert = false
    @State private var navigateToLogin = false
    @State private var selectedPaymentMethod: String? = nil
    let paymentMethods = ["Credit Card", "Debit Card", "Apple Pay", "Cash On Delivery"]
    @State private var address: String = ""
    
    @EnvironmentObject var cartManager : CartManager


    var body: some View {
        NavigationView {
            VStack {
                Text("CHECKOUT")
                    .font(.custom("AmericanTypewriter", size: 25))
                    .foregroundColor(Color(red: 242/255, green: 157/255, blue: 154/255)).bold()
                    .frame(width: 308, height: 115)
                    .padding(.top, 50)

                VStack {
                    Text("Order Details")
                        .font(.custom("AmericanTypewriter", size:20))
                        .foregroundColor(Color.black)
                        .frame(width: 308, height: 115)
                        .padding(.bottom, 50)
                        .offset(x:-110,y:320)
                    
                    
                    HStack{
                        
                        HStack{
                            
                            Text("Total Amount").font(.custom("AmericanTypewriter", size: 20))
                                .foregroundColor(Color.gray)
                                .offset(x:-50, y:-300)
                            
                            Text("Rs.\(cartManager.total).00").font(.custom("AmericanTypewriter", size: 20))
                                .foregroundColor(Color.gray)
                                .offset(x:50, y:-300)
                            
                            
                        }.offset(y:550)
                    }
                }

                VStack {
                    Spacer()

                    VStack {
                        Text("Select your Payment Method")
                            .font(.custom("AmericanTypewriter", size: 20))
                            .foregroundColor(Color.black)
                            .frame(width: 308, height: 115).offset(y:-65)

                        ForEach(paymentMethods, id: \.self) { method in
                            Button(action: {
                                if selectedPaymentMethod == method {
                                    selectedPaymentMethod = nil // Deselect if already selected
                                } else {
                                    selectedPaymentMethod = method
                                }
                                // Reset address field if a different payment method is selected
                                if method != "Cash On Delivery" {
                                    address = ""
                                }
                            }) {
                                HStack {
                                    Text(method)
                                    Spacer()
                                    if selectedPaymentMethod == method {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.red)
                                    } else {
                                        Image(systemName: "circle")
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding()
                            }
                            .foregroundColor(.blue).offset(y:-88)
                        }

                        if selectedPaymentMethod == "Cash On Delivery" {
                            TextField("Enter Address", text: $address)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding().offset(y:-95)
                        }
                    }
                    .offset(y: -200)

                    Button(action: {
                        showAlert = true
                    }) {
                        Text("Place Order")
                    }
                    .font(.custom("Mongolian Baiti", size: 22))
                    .foregroundColor(Color.white)
                    .frame(width: 160, height: 60)
                    .background(Color(red: 242/255, green: 157/255, blue: 154/255))
                    .cornerRadius(10)
                    .padding(15)
                    .shadow(radius: 25)
                    .offset(y: -80)
                }
                Spacer()
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Login Required"),
                    message: Text("You need to login before completing the order."),
                    primaryButton: .default(Text("Login"), action: {
                        // Navigate to login page
                        navigateToLogin = true
                    }),
                    secondaryButton: .cancel()
                )
            }
            // Navigation to Login View
            .background(
                NavigationLink(
                    destination: loginView(),
                    isActive: $navigateToLogin,
                    label: {
                        EmptyView()
                    }
                )
            )

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(CartManager())
    }
}
