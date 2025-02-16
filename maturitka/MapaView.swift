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
       Landmark(title: "Test",
               coordinate: CLLocationCoordinate2D(latitude: 48.95654, longitude: 20.52242),
               subtitle: "Testik")
   ]

   // Main view builder
   var body: some View {
       // Map view s počiatočnou pozíciou
       Map(initialPosition: .region(region)) {
           // Iterujeme cez landmarky a vytvárame anotácie
           ForEach(landmarks) { landmark in
               // Custom anotácia pre každý landmark
               Annotation(landmark.title, coordinate: landmark.coordinate) {
                   // Vertical stack pre pin a label
                   VStack {
                       // Custom pin ikona
                       Image(systemName: "mappin.circle.fill")
                           .resizable()
                           .frame(width: 30, height: 30)
                           .foregroundColor(.red)
                       // Label pod pinom
                       Text(landmark.title)
                           .font(.caption)
                           .padding(5)
                           .background(Color.white)
                           .cornerRadius(5)
                           .shadow(radius: 5)
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
