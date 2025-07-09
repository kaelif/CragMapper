import SwiftUI
import MapKit

struct ContentView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 39.5, longitude: -98.35), // Center of US
        span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20)
    )
    let crags: [Crag] = loadCrags()

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: crags) { crag in
            MapMarker(coordinate: crag.coordinate, tint: .red)
        }
        .edgesIgnoringSafeArea(.all)
    }
}