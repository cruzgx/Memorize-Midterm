//
//  SlotItem.swift
//  Midterm
//
//  Created by Cruz Gonzalez Garcia on 11/2/21.
//  One of the 3 items being shown as a slot machine

//  Think of this represening of the 7s in a 7 7 7 slot matchine
import Foundation

struct SlotItem: Identifiable, Equatable {
    
    //features that a SlotItem has
    var shape: Shapes
    var color: Colors
    var shade: Shades
    var id: Int
    
    init(shape: Shapes, color: Colors, shade: Shades, id: Int) {
        self.shape = shape
        self.color = color
        self.shade = shade
        self.id = id
    }
    
    enum Shapes {
        //CHECK SPELLING
        case isometricTriangle // ▲
        case rightTraingle     // ▶
        case downTraingele     // ▼
        case leftTraingle      // ◀
        case square            // ◼
        case circle            // ●
        case diamond           // ◆
    
        static var all = [Shapes.isometricTriangle, rightTraingle, downTraingele, leftTraingle, square, circle, diamond]
    }
    
    enum Colors { //RED, BLUE, GREEN, PURPLE
        case red
        case blue
        case green
        case purple
        
        static var all = [Colors.red, blue, green, purple]
    }
    
    enum Shades {
        case filled
        case outlined
        case shaded
        
        static var all =  [Shades.filled, outlined, shaded]
    }   
    
    static func  == (lhs: SlotItem, rhs: SlotItem) -> Bool {
        return
            lhs.shape == rhs.shape &&
            lhs.color == rhs.color &&
            lhs.shade == rhs.shade &&
            lhs.id == rhs.id
    }
    
}
