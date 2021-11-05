//
//  SlotMachine.swift
//  Midterm
//
//  Created by Cruz Gonzalez Garcia on 11/3/21.
//

import Foundation

struct SlotMachine {
    var slotCards = Array<SlotItem>() //the whole possible set deck.
//    var shownSlotItems =  [SlotItem]() //slots currently being shown ex: 7 7 7
//    var balance = 100
    
    //start the game
    
    init() {
        var id = 1
        for shapes in SlotItem.Shapes.all {
            for colors in SlotItem.Colors.all {
                for shades in SlotItem.Shades.all {
                    self.slotCards += [SlotItem(shape: shapes, color: colors, shade: shades, id: id)]
                    id += 1
                }
            }
        }
        
        slotCards.shuffle()
    }
    
    mutating func get3SlotItems() -> Array<SlotItem>? {
        if slotCards.count < 3 {
            return nil
        }
        
        var myReturnVals = Array<SlotItem>()
        for _ in 0..<3 {
            myReturnVals.append(slotCards.remove(at: 0))
        }
        
        return myReturnVals
    }
    
//    mutating func spin() {
//        if(shownSlotItems.count == 3) {
//            shownSlotItems.removeAll()
//        }
//
//        for _ in 0..<3 {
//            if let index = slotCards.indices.randomElement() {
//                shownSlotItems.append(slotCards.remove(at: index))
//                //check for any sets here.
//            } else {
//                //DISABLE SPIN BUTTON.
//            }
//        }
//
//    }
    
    
}
