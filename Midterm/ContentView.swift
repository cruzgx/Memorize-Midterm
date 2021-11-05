//
//  ContentView.swift
//  Midterm
//
//  Created by Cruz Gonzalez Garcia on 11/2/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: Game = Game()
    
    var body: some View {
            //.padding()
        VStack {
            ScrollView {
                Text("Balance: $ " + String(viewModel.getGameBalance()))
                    .font(.largeTitle)
                
                
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 75))]) {
                    ForEach(viewModel.slotItems) { item in
                        SlotView(item)
                            .aspectRatio(2/3, contentMode: .fit)
                            //.foregroundColor(card.getCardOutline())
                    }
                }
                .padding(.horizontal)
                

                
                
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


struct SlotView : View {
    var slot: SlotItem
    
    init(_ slot: SlotItem) {
        self.slot = slot
    }
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25.0)
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: 3.0)
            
            Text(slot.getCardContents())
                .foregroundColor(.purple)
                .opacity(slot.getCardOpacity())
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
