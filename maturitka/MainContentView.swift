//
//  ContentView.swift
//  maturitka
//
//  Created by Maturitka on 08/12/2024.
//

import SwiftUI

struct MainContentView: View {
    var body: some View {
        // TabView - bottom bar sluziaci ako menu
        TabView {
            // Domov
            DomovView()
                .tabItem {
                    Label("Domov", systemImage: "house")
                }
            
            // Akcie
            NovinkyView()
                .tabItem {
                    Label("Novinky", systemImage: "star.fill")
                }
            
            // Kalendar
            KalendarView()
                .tabItem {
                    Label("Kalendar", systemImage: "calendar")
                }
            
            // Mapa
            MapaView()
                .tabItem {
                    Label("Mapa", systemImage: "map")
                }
            
            // Kontakt
            KontaktView()
                .tabItem {
                    Label("Kontakt", systemImage: "phone.fill")
                }
        }
        .accentColor(.blue) // Farba na selectnutu poloyku
    }
}

#Preview {
    MainContentView()
}
