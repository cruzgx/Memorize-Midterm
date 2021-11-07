//
//  Game.swift
//  Midterm
//
//  Created by Cruz Gonzalez Garcia on 11/4/21.
//

// MARK: This is the viewmodel

import Foundation

class Game: ObservableObject {
    
    @Published private var model = SlotGame()
    
    var slotItems : Array<SlotItem> {
        model.shownSlotItems
    }
    
    //MARK: -Intents
    public func newGame() {
        model = SlotGame()
        print("New Game Method was called!")
    }
    
    public func getGameBalance() -> Int {
        model.balance
    }
    
}



extension Game {

    public func handleSpin(){
        model.spin()
    }
}
