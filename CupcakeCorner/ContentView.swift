//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by EDSON FELIPE VASCONCELOS on 03/05/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var sharedOrder = SharedOrder()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type", selection: $sharedOrder.order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(sharedOrder.order.quantity)", value: $sharedOrder.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $sharedOrder.order.specialRequestEnabled.animation())
                    
                    if sharedOrder.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $sharedOrder.order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $sharedOrder.order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(sharedOrder: sharedOrder)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
