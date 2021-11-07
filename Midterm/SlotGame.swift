//
//  SlotGame.swift
//  Midterm
//
//  Created by Cruz Gonzalez Garcia on 11/4/21.
//

import Foundation

// SlotItem, SlotMachine, & SlotGame are All Part of the Model

struct SlotGame {
    var slotGameCombos = SlotMachine()
    var shownSlotItems =  Array<SlotItem>()  //Ones shown to user.
    var balance = 100
    
    var incurredCost: Int?
    
    init() {

        if let values = slotGameCombos.get3SlotItems() {
            shownSlotItems = values
            //check for set here
        } else {
            print("Ran out of cards slot possibilities.")
        }
        
        for slotItem in shownSlotItems {
            print(slotItem.shape, slotItem.color, slotItem.shade)
        }
        
    }
    
    
    //check is a winiing spin
    mutating public func spin() {
        balance -= 5
        
        if(areAllEqual(arr: shownSlotItems) || notEqAtAll(arr: shownSlotItems)) {
            balance += 1_000
        }
        
        
        //shows 3 new cards
        shownSlotItems.removeAll()
        shownSlotItems = slotGameCombos.get3SlotItems()!
    }

    //MARK: Helper functions!
    
    //Assumes array always has 3 items.
    private func areAllEqual(arr: Array<SlotItem>) -> Bool {
        let A = arr[0]
        let B = arr[1]
        let C = arr[2]
        
        //return A == B && B == C && A == C
        return A.isEqualTo(B) && B.isEqualTo(C) && A.isEqualTo(C)
    }
    
    private func notEqAtAll(arr: Array<SlotItem>) -> Bool {
        let A = arr[0]
        let B = arr[1]
        let C = arr[2]
        
        return A.notEqualAtAll(B) && B.notEqualAtAll(C) && A.notEqualAtAll(C)
    }
}

