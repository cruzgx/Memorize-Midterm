//
//  SlotItem.swift
//  Midterm
//
//  Created by Cruz Gonzalez Garcia on 11/2/21.
//  One of the 3 items being shown as a slot machine

//  Think of this represening of the 7s in a 7 7 7 slot matchine
import Foundation
import SwiftUI

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
    
    static func == (lhs: SlotItem, rhs: SlotItem) -> Bool {
        return
            lhs.shape == rhs.shape &&
            lhs.color == rhs.color &&
            lhs.shade == rhs.shade &&
            lhs.id == rhs.id
    }
    
    public func isEqualTo(_ other: SlotItem) -> Bool {
        return
            self.shape == other.shape &&
            self.color == other.color &&
            self.shade == other.shade
    }
    
    //returns true if the follwoing aren't in any regard.
    public func notEqualAtAll(_ other: SlotItem) -> Bool {
        return
            self.shape != other.shape &&
            self.color != other.color &&
            self.shade != other.shade
    }
    
    
    func getCardContents() -> String {
        if self.shade == Shades.outlined {
            switch self.shape {
            case .isometricTriangle:
                return "△"
            case .rightTraingle:
                return "▷"
            case .downTraingele:
                return "▽"
            case .leftTraingle:
                return "◁"
            case .square:
                return "◻"
            case .circle:
                return "○"
            case .diamond:
                return "◇"
            }
        } else {
            switch self.shape {
            case .isometricTriangle:
                return "▲"
            case .rightTraingle:
                return "▶"
            case .downTraingele:
                return "▼"
            case .leftTraingle:
                return "◀"
            case .square:
                return "◼"
            case .circle:
                return "●"
            case .diamond:
                return "◆"
            }
        }
    }
    
    func getSlotItemColor() -> Color {
        switch self.color {
        case .red:
            return Color.red
        case .blue:
            return Color.blue
        case .green:
            return Color.green
        case .purple:
            return Color.purple
        }
    }
    
    func getCardOpacity() -> Double {
        self.shade == Shades.shaded ? 0.4 : 1.0
    }
}

