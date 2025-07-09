import Foundation
import CoreLocation

struct Crag: Identifiable, Codable {
    let id: String
    let name: String
    let latitude: Double
    let longitude: Double
    let popularity: Int

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

func loadCrags() -> [Crag] {
    guard let url = Bundle.main.url(forResource: "crags", withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let crags = try? JSONDecoder().decode([Crag].self, from: data) else {
        return []
    }
    return crags
}