//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by EDSON FELIPE VASCONCELOS on 03/05/23.
//
import Foundation
import SwiftUI

struct AddressView: View {
    @ObservedObject var sharedOrder: SharedOrder
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $sharedOrder.order.name)
                TextField("Street Adress", text: $sharedOrder.order.streetAddress)
                TextField("City", text: $sharedOrder.order.city)
                TextField("Zip", text: $sharedOrder.order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(sharedOrder: sharedOrder)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(sharedOrder.order.hasValidAdddress == false)
        }
        .navigationTitle("Delivery Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(sharedOrder: SharedOrder())
    }
}
