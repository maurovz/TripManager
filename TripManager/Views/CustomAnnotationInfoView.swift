import SwiftUI

struct CustomAnnotationInfoView: View {
  private let id: Int
  @ObservedObject private var tripListViewModel: TripListViewModel
  
  init(id: Int, tripListViewModel: TripListViewModel) {
    self.id = id
    self.tripListViewModel = tripListViewModel
    self.getStop()
  }
  
  private func getStop() {
    tripListViewModel.fetchStop(id: self.id) { stop in
      self.tripListViewModel.selectedStopViewModel = stop
    }
  }
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Driver`s name")
      Text("\(self.tripListViewModel.selectedStopViewModel?.username ?? "")")
      Text("Price")
      Text("\(self.tripListViewModel.selectedStopViewModel?.price ?? "")")
      Text("Adress")
      Text("\(self.tripListViewModel.selectedStopViewModel?.address ?? "")")
    }.padding()
  }
}

struct CustomAnnotationInfoView_Previews: PreviewProvider {
  static var previews: some View {
    CustomAnnotationInfoView(id: 1, tripListViewModel: TripListViewModel())
  }
}
