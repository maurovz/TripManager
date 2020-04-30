import Foundation
import Combine

class TripListViewModel: ObservableObject {
  @Published var tripViewModel: [TripViewModel] = [TripViewModel]()
  @Published var stopViewModel: [StopViewModel] = [StopViewModel]()
  @Published var selectedTripViewModel: TripViewModel?
  
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
  
  func fetchStop(id: Int, completion: @escaping ((StopViewModel) -> Void)) {
    WebService().getStop(id: "\(String(describing: id))", completion: { stops in
      if let stops = stops {
        completion(StopViewModel(stop: stops))
      }
    })
  }
}
