//
//  HomeView.swift
//  HomeView
//
//  Created by Stewart Lynch on 2021-07-21.
//

import SwiftUI

struct HomeView: View {
    @State private var changeColorText = ""
    @State private var selectedColor: SelectedColor = SelectedColor.chosenColor("red")
    @State private var showPushedView = false
    @State private var showSheet = false
    @State private var showOverlay = false
    var body: some View {
        ZStack {
            selectedColor.color
                .ignoresSafeArea()
            VStack {
                NavigationLink {
                    PushedView(selectedColor: $selectedColor)
                } label: {
                    Text("Navigation Picker")
                }
                .padding(.top,20)
                NavigationLink(isActive: $showPushedView) {
                    PushedView(selectedColor: $selectedColor)
                } label: {
                    EmptyView()
                }

                VStack(alignment: .leading) {
                    TextField("Enter the words 'change color'", text: $changeColorText)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                        .onSubmit {
                            if changeColorText == "change color" {
                                showPushedView.toggle()
                            }
                            changeColorText = ""
                        }
                    Text("Enter the words 'change color'")
                        .font(.caption)
                }.padding()
                Button("Sheet Picker") {
                    showSheet.toggle()
                }
                .sheet(isPresented: $showSheet) {
                    SheetView(selectedColor: $selectedColor, showOverlay: $showOverlay)
                }
                Button("Overlay Picker") {
                    withAnimation {
                        showOverlay.toggle()
                    }
                    
                }
                Spacer()
            }.buttonStyle(.customButtonStyle)
            if showOverlay {
                SheetView(selectedColor: $selectedColor, showOverlay: $showOverlay)
                    .zIndex(1)
            }
        }
        .navigationTitle("Presenting Views")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
