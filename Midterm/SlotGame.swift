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
    
    
}

