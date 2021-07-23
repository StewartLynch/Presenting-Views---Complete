//
//  ContentView.swift
//  Presenting Views
//
//  Created by Stewart Lynch on 2021-07-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            HomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
