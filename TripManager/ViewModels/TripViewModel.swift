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
  
  var stops: [StopInfo?]? {
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
  
  func makeStopAnnotations(stops: [StopInfo?]) -> [MKPointAnnotation] {
    let annotations = stops.map({ (stop) -> MKPointAnnotation in
      let annotation = StopAnnotation()
      if let stop = stop, let point = stop.point {
        annotation.coordinate = CLLocationCoordinate2D(latitude: point._latitude, longitude: point._longitude)
        annotation.id = stop.id
      }
      return annotation
    })
    return annotations
  }
}
