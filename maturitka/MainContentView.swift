//
//  ContentView.swift
//  maturitka
//
//  Created by Maturitka on 08/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isMenuOpen = false // State to toggle the menu
    
    var body: some View {
        NavigationView {
            ZStack {
                // Main Content

                // Side Menu (Slide-in from the left)
                HStack {
                    SideMenuView()
                        .offset(x: isMenuOpen ? 0 : -250) // Menu moves in/out from left
                        .animation(.easeInOut(duration: 0.3), value: isMenuOpen) // Slide-in effect
                    Spacer()
                }
            }
            .navigationBarTitle("Maturitka Menu", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                // Toggle Menu
                withAnimation {
                    isMenuOpen.toggle()
                }
            }) {
                Image(systemName: "line.horizontal.3")
                    .resizable()
                    .frame(width: 24, height: 18)
                    .foregroundColor(.black)
            })
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
