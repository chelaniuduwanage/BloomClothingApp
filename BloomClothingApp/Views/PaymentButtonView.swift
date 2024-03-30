//
//  PaymentButtonView.swift
//  BloomClothingApp
//
//  Created by User on 2024-03-30.
//

import SwiftUI
import PassKit


struct PaymentButtonView: View {
    var action: () -> Void

    var body: some View {
        
        Representable(action: action)

    }
}

#Preview {
    PaymentButtonView(action: {}).frame(minWidth: 100, maxHeight: 400)
        .frame(height : 45)
        .frame(maxWidth: .infinity)
}


extension PaymentButtonView {
    struct Representable: UIViewRepresentable {
        var action: () -> Void
        
        func makeCoordinator() -> Coordinator {
            Coordinator(action: action)
        }
        
        func makeUIView(context: Context) -> UIView {
            context.coordinator.button
        }
        
        func updateUIView(_ rootView: UIView, context: Context) {
            context.coordinator.action = action
        }
    }
    
    
    class Coordinator: NSObject {
           var action: () -> Void
           var button = PKPaymentButton(paymentButtonType: .checkout, paymentButtonStyle: .automatic)
           
           init(action: @escaping () -> Void) {
               self.action = action
               super.init()

               button.addTarget(self, action: #selector(callback(_:)), for: .touchUpInside)
           }
           
           @objc
           func callback(_ sender: Any) {
               action()
           }
       }
   }
