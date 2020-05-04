import SwiftUI

struct HomeView: View {
  @ObservedObject private var tripListViewModel = TripListViewModel()
  @State var contactFormViewModel = ContactFormViewModel()
  @State var showContactForm = false
  @State var showFullMap = false
  private let tripListMinimumOffset = UIScreen.main.bounds.height * 0.2
  private let tripListMaximumOffset = UIScreen.main.bounds.height * 0.8
  
  init() {
    tripListViewModel.load()
    setupBadge()
  }
  
  var body: some View {
    ZStack {
      MapView(tripViewModel: tripListViewModel.selectedTripViewModel)
      VStack(spacing: 0) {
        TripListView(tripListViewModel: tripListViewModel, onDragBegin: { value in
          self.tripListViewModel.dragOffset = CGSize(width: value.translation.width, height: value.translation.height)
        }, onDragEnd: { value in
          if value.translation.height < self.tripListMinimumOffset {
            self.tripListViewModel.dragOffset = CGSize(width: 0, height: self.tripListMinimumOffset)
          } else {
            self.tripListViewModel.dragOffset = CGSize(width: 0, height: self.tripListMaximumOffset)
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
  
  private func setupBadge() {
    UNUserNotificationCenter.current().requestAuthorization(options: .badge) { (_, _) in }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
