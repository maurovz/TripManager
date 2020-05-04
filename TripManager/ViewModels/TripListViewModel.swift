import UIKit

class TripListViewModel: ObservableObject {
  @Published var tripViewModel: [TripViewModel] = [TripViewModel]()
  @Published var stopViewModel: [StopViewModel] = [StopViewModel]()
  @Published var selectedTripViewModel: TripViewModel?
  @Published var didSelectTrip: Bool = false
  @Published var selectedStopViewModel: StopViewModel?
  @Published var dragOffset = CGSize(width: 0, height: UIScreen.main.bounds.height * 0.8)
  
  func load() {
    fetchTrips()
  }
  
  func resetDragOffset() {
    dragOffset = CGSize(width: 0, height: UIScreen.main.bounds.height * 0.8)
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
    WebService().getStop(id: "\(String(describing: id))", completion: { stop in
      if let stop = stop {
        completion(StopViewModel(stop: stop))
      }
    })
  }
}
