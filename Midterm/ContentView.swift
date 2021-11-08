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
                 .lTitle()
                
                
//                LazyVGrid(columns:[GridItem(.adaptive(minimum: 75))]) {
//                    ForEach(viewModel.slotItems) { item in
//                        SlotView(item)
//                        .aspectRatio(2/3, contentMode: .fit)
//                            //BUG EXISTS BELOW
//                            .opacity(item.getCardOpacity())
//                            .foregroundColor(item.getSlotItemColor())
//                            //.background(item.getSlotItemColor())
//
//                    }
//                }
//                .padding(.horizontal)
                
                HStack {
                    ForEach(viewModel.slotItems) { item in
                        SlotView(item)
                            .aspectRatio(2/3, contentMode: .fit)
                            //BUG EXISTS BELOW - with opacity
                            .opacity(item.getCardOpacity())
                            .foregroundColor(item.getSlotItemColor())
                            //.background(item.getSlotItemColor())
                        
                    }
                }
                .padding()
            
                
                HStack {
                    Button(action: {viewModel.newGame()}, label: {
                        VStack {
                            Image(systemName: "play.circle.fill")
                                .lTitle()
                            Text("New Game")
                                .font(.caption)
                        }
                    })
                    Spacer()
                    Button(action: {
                        withAnimation {
                            viewModel.handleSpin()
                        }
                    }, label: {
                        VStack {
                            Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                                .lTitle()
                            Text("Spin")
                                .font(.caption)
                        }
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
                
//                .foregroundColor(slot.getSlotItemColor())
//                .opacity(slot.getCardOpacity())
        }
    }
    
}



struct LTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
    }
}

extension View {
    func lTitle() -> some View {
        self.modifier(LTitle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
