import SwiftUI

struct HomeView: View {
  @ObservedObject private var tripListViewModel = TripListViewModel()
  @State var contactFormViewModel = ContactFormViewModel()
  @State var showContactForm = false
  private let tripListOffset = UIScreen.main.bounds.height * 0.2
  
  init() {
    tripListViewModel.load()
  }
  
  var body: some View {
    ZStack {
      MapView(tripViewModel: tripListViewModel.selectedTripViewModel)
      VStack(spacing: 0) {
        TripListView(tripListViewModel: tripListViewModel, onDragBegin: { value in
          self.tripListViewModel.dragOffset = CGSize(width: value.translation.width, height: value.translation.height)
        }, onDragEnd: { value in
          if value.translation.height < self.tripListOffset {
            self.tripListViewModel.dragOffset = CGSize(width: 0, height:  100)
          } else {
            self.tripListViewModel.dragOffset = CGSize(width: 0, height: 720)
          }
        }).animation(.spring())
        .offset(y: tripListViewModel.dragOffset.height)

      }
      VStack() {
        HStack {
          Spacer()
          Button("Report Issue") {
            self.showContactForm.toggle()
          }.padding()
          .sheet(isPresented: $showContactForm) {
            ContactFormView(contactFormViewModel: self.$contactFormViewModel)
          }
        }
        Spacer()
      }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
