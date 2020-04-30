import SwiftUI

struct CustomAnnotationInfoView: View {
  //  let trip: Trip
  
  var body: some View {
      VStack(alignment: .leading) {
        Text("Driver`s name")
        Text("trip.driverName")
        Text("Time")
        Text("trip.driverName")
        Text("Price")
        Text("trip.driverName")
        Text("Adress")
        Text("trip.driverName")
      }.padding()
  }
}

struct CustomAnnotationInfoView_Previews: PreviewProvider {
  static var previews: some View {
    CustomAnnotationInfoView()
  }
}
