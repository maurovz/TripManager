import SwiftUI

struct HomeView: View {
  @ObservedObject private var tripListViewModel = TripListViewModel()
  
  init() {
    tripListViewModel.load()
  }
  
  var body: some View {
    VStack {
      MapView(tripViewModel: tripListViewModel.selectedTripViewModel)
      TripListView(tripsViewModel: tripListViewModel.tripViewModel, tripListViewModel: tripListViewModel)
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
