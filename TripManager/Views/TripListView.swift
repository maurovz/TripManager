import SwiftUI

struct TripListView: View {
  @ObservedObject var tripListViewModel: TripListViewModel
  let onDragBegin: (DragGesture.Value) -> Void
  let onDragEnd: (DragGesture.Value) -> Void
  
  var body: some View {
    UITableView.appearance().separatorColor = .clear
    return VStack(spacing: 0) {
      HStack {
        Spacer()
        VStack {
          Text("Upcoming Trips").font(.custom("Arial", size: 30))
            .foregroundColor(.black)
            .padding(2)
          
          Text("Scroll ip to see all trips").font(.custom("Arial", size: 15))
            .foregroundColor(.gray)
            .padding(2)
        }.padding(10)
        Spacer()
      }  .contentShape(Rectangle())
        .contentShape(Rectangle())
        .background(Color.white)
        .gesture(DragGesture()
          .onChanged(self.onDragBegin)
          .onEnded(self.onDragEnd))

      
      List(tripListViewModel.tripViewModel, id: \.driverName) { trip in
        Spacer()
        TripCellView(trip: trip).onTapGesture {
          self.tripListViewModel.resetDragOffset()
          self.tripListViewModel.selectedTripViewModel = trip
        }.cornerRadius(20)
        .shadow(radius: 10)
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
        Spacer()
      }
      Spacer()
    }
  }
}

struct TripCellView: View {
  let trip: TripViewModel
  var body: some View {
    VStack {
      ZStack {
        Image("background")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 300, height: 110, alignment: .top)
          .opacity(0.2)
        HStack {
          VStack(alignment: .leading) {
            Text("Trip Description")
              .font(.custom("Arial", size: 20))
              .fontWeight(.semibold)
              .foregroundColor(Color.black)
              .padding(.bottom)
            HStack(alignment: .top) {
              Text("Driver")
              Text(trip.driverName)
                .padding(.leading)
            }
            HStack(alignment: .top) {
              Text("Time")
              Text(trip.startTime)
                .padding(.leading)
            }
            HStack(alignment: .top) {
              Text("Destination")
              Text(trip.destination.address)
                .padding(.leading)
            }
            HStack(alignment: .top) {
              Text("Description")
                .foregroundColor(.black)
            }
            HStack(alignment: .top) {
              Text(trip.description)
                .foregroundColor(.black)
            }
          }
          Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
      }
      Spacer()
    }
    .frame(width: 340.0, height: 220.0)
    .background(Color.white)
    .cornerRadius(20)
    .shadow(radius: 10)
    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
  }
}

struct TripListView_Previews: PreviewProvider {
  static var previews: some View {
    let trip = Trip(status: "", origin: Origin(address: "John St", point: Point(_latitude: 300.00, _longitude: 300.00)), stops: [StopInfo(point: Point(_latitude: 300, _longitude: 300), id: 3)], destination: Destination(address: "Peer St", point: Point(_latitude: 300, _longitude: 300)), endTime: "300", startTime: "300", description: "Description Point", driverName: "Ben", route: "1234XD")

    let tripListViewModel = TripListViewModel()
    tripListViewModel.tripViewModel = [TripViewModel(trip: trip)]

    return TripListView(tripListViewModel: tripListViewModel, onDragBegin: { _ in }, onDragEnd: { _ in })
  }
}
