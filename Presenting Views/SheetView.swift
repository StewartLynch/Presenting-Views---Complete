//
//  SheetView.swift
//  SheetView
//
//  Created by Stewart Lynch on 2021-07-21.
//

import SwiftUI

struct SheetView: View {
    @Binding var selectedColor: SelectedColor
    @Environment(\.dismiss) private var dismiss
    @Binding var showOverlay: Bool
    var body: some View {
        ZStack {
            Color(.systemBackground).opacity(showOverlay ? 0.4 : 1)
                .ignoresSafeArea()
                .onTapGesture {
                    if showOverlay {
                        withAnimation {
                            showOverlay.toggle()
                        }
                    } else {
                        dismiss()
                    }
                }
            VStack {
                RoundedRectangle(cornerRadius: 20).fill(Color(.systemBackground))
                    .padding()
                    .shadow(color: .black.opacity(0.4), radius: 2, x: 2, y: 2)
                    .overlay(
                        List() {
                            ForEach(SelectedColor.allColors) { color in
                                ZStack {
                                    color.color
                                        .onTapGesture {
                                            selectedColor = color
                                            if showOverlay {
                                                withAnimation {
                                                    showOverlay.toggle()
                                                }
                                            } else {
                                                dismiss()
                                            }
                                        }
                                    Text(color.name)
                                        .foregroundColor(selectedColor == color ? .white : .black)
                                }
                                .frame(height: 40)
                            }
                            .listRowSeparator(.hidden)
                        }
                            .listStyle(.plain)
                            .padding(40)
                    )
                    .frame(width: 250, height: 450)
                Spacer()
            }
        }
        
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView(selectedColor: .constant(SelectedColor.chosenColor("red")), showOverlay: .constant(false))
    }
}
