import UIKit
import MapKit
import SwiftUI

struct InitialMapView: UIViewRepresentable {
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  func makeUIView(context: Context) -> MKMapView {
    let map = MKMapView()
    map.showsUserLocation = true
    map.delegate = context.coordinator
    return map
  }
  
  func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<InitialMapView>) {
  }
}

struct InitialMapView_Previews: PreviewProvider {
  static var previews: some View {
    InitialMapView()
  }
}
