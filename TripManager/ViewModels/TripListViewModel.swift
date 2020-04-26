import Foundation

class TripListViewModel: ObservableObject {
  @Published var tripViewModel: [TripViewModel] = [TripViewModel]()
  
  func load() {
    fetchTrips()
  }
  
  private func fetchTrips() {
    WebService().getTrips { trips in
      if let trips = trips {
        DispatchQueue.main.async {
          self.tripViewModel = trips.map(TripViewModel.init)
        }
      }
    }
  }
}
