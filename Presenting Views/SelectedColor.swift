//
//  SelectedColor.swift
//  SelectedColor
//
//  Created by Stewart Lynch on 2021-07-21.
//

import SwiftUI

struct SelectedColor: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var color: Color
    
    static func ==(lhs: SelectedColor, rhs: SelectedColor) -> Bool {
        return lhs.name == rhs.name && lhs.color == rhs.color
    }
    
    static var allColors:[SelectedColor] {
        [
            SelectedColor(name: "red", color: .red),
            SelectedColor(name: "orange", color: .orange),
            SelectedColor(name: "yellow", color: .yellow),
            SelectedColor(name: "green", color: .green),
            SelectedColor(name: "blue", color: .blue),
            SelectedColor(name: "indigo", color: .indigo),
            SelectedColor(name: "violet", color: Color(uiColor: UIColor(red: 127/255, green: 0, blue: 1, alpha: 1)))
        ]
    }
    
    static func chosenColor(_ color:String) -> SelectedColor {
        return Self.allColors.first {$0.name.lowercased() == color.lowercased()} ?? SelectedColor(name: "white", color: .white)
    }
}
