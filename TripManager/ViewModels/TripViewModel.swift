import Foundation

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
  
  var route: String {
    return self.trip.route
  }
}
