//
//  ContentView.swift
//  Midterm
//
//  Created by Cruz Gonzalez Garcia on 11/2/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            //.padding()
        VStack {
            ScrollView {
                Text("Balance: $ X")
                    .font(.largeTitle)
                
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Left Button")
                    })
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Right Button")
                    })
                    
                }
                .padding()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
