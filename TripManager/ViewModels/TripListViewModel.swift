import UIKit

class TripListViewModel: ObservableObject {
  @Published var tripViewModel: [TripViewModel] = [TripViewModel]()
  @Published var stopViewModel: [StopViewModel] = [StopViewModel]()
  @Published var selectedTripViewModel: TripViewModel?
  @Published var selectedStopViewModel: StopViewModel?
  @Published var dragOffset: CGSize = CGSize(width: 0, height: 400)
  
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
    WebService().getStop(id: "\(String(describing: id))", completion: { stop in
      if let stop = stop {
        self.saveStop(stop: stop)
        completion(StopViewModel(stop: stop))
      }
    })
  }
  
  func saveStop(stop: Stop) {
    CoreDataManager.shared.saveStop(stop: stop)
  }
}
