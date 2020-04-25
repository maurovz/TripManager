import SwiftUI

struct HomeView: View {
  let trip = Trip(status: "", origin: Origin(address: "John St", point: Point(_latitude: 300.00, _longitude: 300.00)), stops: [Stops(point: Point(_latitude: 300, _longitude: 300), id: 3)], destination: Destination(address: "Peer St", point: Point(_latitude: 300, _longitude: 300)), endTime: "300", startTime: "300", description: "Hellooo", driverName: "Ben", route: "Laawwwl")
  var body: some View {
    VStack {
      MapView()
      TripListView(trips: [trip])
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
