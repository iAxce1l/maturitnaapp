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
            
            // Aktuality
            AkcieView()
                .tabItem {
                    Label("Aktuality", systemImage: "star.fill")
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
        .accentColor(.blue) // Farba na selectnutu položku
    }
}

#Preview {
    MainContentView()
}
