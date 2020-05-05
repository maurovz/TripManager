import UIKit
import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
  private let tripViewModel: TripViewModel?
  
  init(tripViewModel: TripViewModel?) {
    self.tripViewModel = tripViewModel
  }
  
  func makeCoordinator() -> MapViewCoordinator {
    MapViewCoordinator(self)
  }
  
  func makeUIView(context: Context) -> MKMapView {
    let mapView = MKMapView()
    mapView.showsUserLocation = true
    mapView.delegate = context.coordinator
    return mapView
  }
  
  func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
    updateAnnotations(from: uiView)
  }
  
  func updateAnnotations(from mapView: MKMapView) {
    if let tripViewModel = tripViewModel, let route = tripViewModel.route, let stops = tripViewModel.stops {
      mapView.removeAnnotations(mapView.annotations)
      let annotations = tripViewModel.makeStopAnnotations(stops: stops)
      mapView.addAnnotations(annotations)
      
      mapView.removeOverlays(mapView.overlays)
      let polyline = MKPolyline(coordinates: route, count: route.count)
      mapView.addOverlay(polyline)
      setVisibleMapArea(map: mapView, polyline: polyline, edgeInsets: UIEdgeInsets(top: 30.0, left: 30.0, bottom: 30.0, right: 30.0), animated: true)
    }
  }

  private func setVisibleMapArea(map: MKMapView, polyline: MKPolyline, edgeInsets: UIEdgeInsets, animated: Bool = false) {
      map.setVisibleMapRect(polyline.boundingMapRect, edgePadding: edgeInsets, animated: animated)
  }
}

struct InitialMapView_Previews: PreviewProvider {
  static var previews: some View {
    let trip = Trip(status: "", origin: Origin(address: "John St", point: Point(_latitude: 300.00, _longitude: 300.00)), stops: [StopInfo(point: Point(_latitude: 300, _longitude: 300), id: 3)], destination: Destination(address: "Peer St", point: Point(_latitude: 300, _longitude: 300)), endTime: "300", startTime: "300", description: "Route Description ", driverName: "Ben", route: "PTY6y7d68")
    let tripViewModel = TripViewModel(trip: trip)
    return MapView(tripViewModel: tripViewModel)
  }
}
