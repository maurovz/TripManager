import SwiftUI

struct HomeView: View {
  let tripListViewModel = TripListViewModel()
  
  init() {
    tripListViewModel.load()
  }
  var body: some View {
    VStack {
      MapView()
      TripListView(tripsViewModel: tripListViewModel.tripViewModel)
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
