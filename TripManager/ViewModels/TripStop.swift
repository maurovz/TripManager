import Foundation
import MapKit

struct TripStop {
  
  let placemark: MKPlacemark
  let id: Int
  
  var name: String {
    self.placemark.name ?? ""
  }
  
  var title: String {
    self.placemark.title ?? ""
  }
  
  var coordinate: CLLocationCoordinate2D {
    self.placemark.coordinate
  }
}

