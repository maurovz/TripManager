import Foundation
import MapKit

final class MapViewCoordinator: NSObject, MKMapViewDelegate, ObservableObject {
  private let map: MapView
  private let tripListViewModel = TripListViewModel()
  
  init(_ control: MapView) {
    self.map = control
  }
  
  func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
    if let annotationView = views.first, let annotation = annotationView.annotation {
      if annotation is MKUserLocation {
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
      }
    }
  }
  
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    guard annotation is StopAnnotation else { return nil }
    guard let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)  else { return nil }
    annotationView.annotation = annotation
    mapView.register(CustomAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
    return annotationView
  }

  func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    if let annotation = view.annotation as? StopAnnotation, let id = annotation.id {
      tripListViewModel.fetchStop(id: id) { stop in
        DispatchQueue.main.async {
          self.map.updateAnnotations(from: mapView)
        }
      }
    }
  }
  
  func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    let renderer = MKPolylineRenderer(overlay: overlay)
    renderer.strokeColor = .red
    renderer.lineWidth = 4.0
    return renderer
  }
}
