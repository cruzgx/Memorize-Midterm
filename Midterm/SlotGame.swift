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
    
    
    //check is a wining spin
    mutating public func spin() {
        balance -= 5
        
        if(areAllEqual(arr: shownSlotItems) || notEqAtAll(arr: shownSlotItems)) {
            balance += 1000
        } else if twoSame(arr: shownSlotItems) {
            balance += 500
        } else if oneSame(arr: shownSlotItems) || allOneDif(arr: shownSlotItems) {
            balance += 100
        }
        
        
        //shows 3 new cards
        shownSlotItems.removeAll()
        shownSlotItems = slotGameCombos.get3SlotItems()! //FIX ME: Error when nil.
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
    
    //returns true if all items have 2 same features
    private func twoSame(arr: Array<SlotItem>) -> Bool {
        let A = arr[0]
        let B = arr[1]
        let C = arr[2]
        
        
        //check A & B & C have the 2 same feat.
        let areAandB2same =  (A.shape == B.shape && (A.shape == C.shape) && A.color == B.color && (A.color == C.color) )
                          || (A.shape == B.shape && (A.shape == C.shape) && A.shade == B.shade && (A.shade == C.shade) )
        
        return areAandB2same
    }
    
    //add function that returns true if 2 features are never identical.
    //--- HERE -->
    
    
    //returns true if one item is similar across all cards...
    private func oneSame(arr: Array<SlotItem>) -> Bool {
        let A = arr[0]
        let B = arr[1]
        let C = arr[2]
        
        //check if shape is the same
        let isShapeSame = A.shape == B.shape && B.shape == C.shape && A.shape == C.shape
        let isColorSame = A.color == B.color && B.color == C.color && A.color == C.color
        let isShadeSame = A.shade == B.shade && B.shade == C.shade && A.shade == C.shade
        
        return isShapeSame || isColorSame || isShadeSame
    }
    
    //returns true if if only one attribute is ALL different.
    private func allOneDif(arr: Array<SlotItem>) -> Bool {
        let A = arr[0]
        let B = arr[1]
        let C = arr[2]
        
        let isAllShapeDif  = A.shape != B.shape && B.shape != C.shape && A.shape != C.shape
        let isAllColorDif  = A.color != B.color && B.color != C.color && A.color != C.color
        let isAllShadeDiff = A.shade != B.shade && B.shade != C.shade && A.shade != C.shade
        
        return isAllShapeDif || isAllColorDif || isAllShadeDiff
    }
}

