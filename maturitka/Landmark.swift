import Foundation
import MapKit

struct Landmark: Identifiable {
    let id = UUID()
    let title: String
    let coordinate: CLLocationCoordinate2D
    let subtitle: String?
}
