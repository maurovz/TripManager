import SwiftUI

struct HomeView: View {
  var body: some View {
    VStack {
      MapView()
      TripListView()
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
