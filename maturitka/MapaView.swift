import SwiftUI
import MapKit

struct MapaView: View {
    // Definicia start regionu
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.95654, longitude: 20.52242),
        span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
    )
    


    // Zoznam custom landmarkov
    let landmarks = [
        Landmark(title: "Test", coordinate: CLLocationCoordinate2D(latitude: 48.95654, longitude: 20.52242), subtitle: "Testik")
]

    var body: some View {
        Map(initialPosition: .region(region)) {
            // pridanie anotacii
            ForEach(landmarks) { landmark in
                Annotation(landmark.title, coordinate: landmark.coordinate) {
                    VStack {
                        Image(systemName: "mappin.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.red)
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
        .mapControls {
            MapUserLocationButton() // čudlik na centrovanie lokacie
            MapCompass() // kompas čudlik
        }
        .edgesIgnoringSafeArea(.all)
    }
}
