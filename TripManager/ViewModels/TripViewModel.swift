import Foundation
import Polyline
import MapKit

struct TripViewModel {
  let trip: Trip
  
  var status: String {
    return self.trip.status
  }
  
  var origin: Origin {
    return self.trip.origin
  }
  
  var stops: [Stop?]? {
    return self.trip.stops
  }
  
  var destination: Destination {
    return self.trip.destination
  }
  
  var startTime: String {
    return self.trip.startTime
  }
  
  var endTime: String {
    return self.trip.endTime
  }
  
  var description: String {
    return self.trip.description
  }
  
  var driverName: String {
    return self.trip.driverName
  }
  
  var route: [CLLocationCoordinate2D]? {
    return decodePolyline(trip.route)
  }
  
  func makeStopAnnotations(route: [CLLocationCoordinate2D]) -> [StopAnnotation] {
    let tripStops = route.map { TripStop(placemark: MKPlacemark(coordinate: $0)) }
    return tripStops.map(StopAnnotation.init)
  }
}
