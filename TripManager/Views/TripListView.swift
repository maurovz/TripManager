import SwiftUI

struct TripListView: View {
  let tripsViewModel: [TripViewModel]
  let screenSize = UIScreen.main.bounds.size
  
  var body: some View {
    UITableView.appearance().separatorColor = .clear
    print(tripsViewModel.count)
    return VStack {
      HStack {
        VStack {
          Text("Upcoming Trips").font(.custom("Arial", size: 30))
            .foregroundColor(.black)
            .padding(2)
          
          Text("Scroll ip to see all trips").font(.custom("Arial", size: 15))
            .foregroundColor(.gray)
            .padding(2)
        }
      }.contentShape(Rectangle())
      
      List(tripsViewModel, id: \.startTime) { trip in
        VStack {
          ZStack {
            Image("background")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 300, height: 110, alignment: .top)
              .opacity(0.5)
            HStack {
              VStack(alignment: .leading) {
                Text("Trip Description")
                  .font(.title)
                  .fontWeight(.semibold)
                  .foregroundColor(Color.black)
                HStack {
                  Text("Driver")
                }
                HStack {
                  Text("Time")
                }
                HStack {
                  Text("Destination")
                }
                HStack {
                  Text("Description")
                    .foregroundColor(.black)
                }
                Spacer()
              }
              Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
          }
        }
        .frame(width: 340.0, height: 220.0)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
      }
    }
  }
}

struct TripListView_Previews: PreviewProvider {
  static var previews: some View {
    let trip = Trip(status: "", origin: Origin(address: "John St", point: Point(_latitude: 300.00, _longitude: 300.00)), stops: [Stop(point: Point(_latitude: 300, _longitude: 300), id: 3)], destination: Destination(address: "Peer St", point: Point(_latitude: 300, _longitude: 300)), endTime: "300", startTime: "300", description: "Hellooo", driverName: "Ben", route: "Laawwwl")
    let tripViewModel = TripViewModel(trip: trip)

    return TripListView(tripsViewModel: [tripViewModel])
  }
}
