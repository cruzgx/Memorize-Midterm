//
//  SlotMachine.swift
//  Midterm
//
//  Created by Cruz Gonzalez Garcia on 11/3/21.
//

import Foundation

struct SlotMachine {
    var slotCards = Array<SlotItem>() //the whole possible set deck.
    var shownSlotItems =  [SlotItem]() //slots currently being shown ex: 7 7 7
    var balance = 100
    
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
    
//    func spin() {
//        <#function body#>
//    }
    
//    //
//    func count()
    
}
