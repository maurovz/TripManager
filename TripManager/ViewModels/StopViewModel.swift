import Foundation

struct StopViewModel {
  let stop: Stop
  
  var username: String {
    return stop.userName
  }
  
  var stopTime: String {
    return stop.stopTime
  }
  
  var paid: Bool {
    return stop.paid
  }
  
  var address: String {
     return stop.address
   }
  
  var tripId: Int {
     return stop.tripId
   }
  
  var price: String {
    return String(format: "$%.02f", stop.price)
   }
}
