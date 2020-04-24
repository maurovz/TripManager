import UIKit
import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  func makeUIView(context: Context) -> MKMapView {
    let map = MKMapView()
    map.showsUserLocation = true
    map.delegate = context.coordinator
    return map
  }
  
  func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
  }
}

struct InitialMapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
  }
}
