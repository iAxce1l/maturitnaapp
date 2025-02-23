import SwiftUI
import MapKit

// Hlavný view pre zobrazenie mapy
struct MapaView: View {
   // State pre región mapy - počiatočné zobrazenie
   @State private var region = MKCoordinateRegion(
       // Centrujeme mapu na konkrétne GPS súradnice
       center: CLLocationCoordinate2D(latitude: 48.95654, longitude: 20.52242),
       // Nastavenie zoomu mapy
       span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
   )
   
   // Array landmarkov/pinov na mape
    let landmarks = [
            Landmark(title: "Obecný úrad",
                     coordinate: CLLocationCoordinate2D(latitude: 48.95842, longitude: 20.51788),
                    subtitle: ""),
            
            Landmark(title: "Ihrisko",
                     coordinate: CLLocationCoordinate2D(latitude: 48.95605, longitude: 20.52465),
                    subtitle: ""),
            
            Landmark(title: "Zberný dvor",
                     coordinate: CLLocationCoordinate2D(latitude: 48.95715, longitude: 20.51226),
                    subtitle: ""),
            
            Landmark(title: "Kultúrny dom",
                     coordinate: CLLocationCoordinate2D(latitude: 48.95476, longitude: 20.52270),
                    subtitle: "Katarínske posedenie"),
            
            Landmark(title: "Železničná stanica",
                     coordinate: CLLocationCoordinate2D(latitude: 48.95335, longitude: 20.52309),
                    subtitle: "")
        ]
    

   // Main view builder
    var body: some View {
            Map(initialPosition: .region(region)) {
                ForEach(landmarks) { landmark in
                    Annotation("", coordinate: landmark.coordinate) {
                        VStack {
                            Image(systemName: "mappin.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.red)
                            VStack(spacing: 2) {
                                Text(landmark.title)
                                    .font(.caption)
                                    .fontWeight(.medium)
                                if let subtitle = landmark.subtitle {
                                    Text(subtitle)
                                        .font(.caption2)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(2)
                        }
                    }
                }
            }
       // Pridanie buttonov
       .mapControls {
           MapUserLocationButton() // Button pre lokalizáciu užívateľa
           MapCompass() // Kompas pre orientáciu
       }
       // Roztiahneme mapu cez celú obrazovku
       .edgesIgnoringSafeArea(.all)
   }
}
