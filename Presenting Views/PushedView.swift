//
//  PushedView.swift
//  PushedView
//
//  Created by Stewart Lynch on 2021-07-21.
//

import SwiftUI

struct PushedView: View {
    @Binding var selectedColor: SelectedColor
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        List() {
            ForEach(SelectedColor.allColors) { color in
                ZStack {
                    color.color
                        .onTapGesture {
                            selectedColor = color
                            dismiss()
                        }
                    Text(color.name)
                        .foregroundColor(selectedColor == color ? .white : .black)
                }
                .frame(height: 40)
            }
            .listRowSeparator(.hidden)
        }
        .navigationTitle(selectedColor.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PushedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PushedView(selectedColor: .constant(SelectedColor.chosenColor("red")))
        }
    }
}
