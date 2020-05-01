import Foundation
import MapKit
import SwiftUI

class CustomAnnotationView: MKPinAnnotationView {
  override var annotation: MKAnnotation? { didSet { configureDetailView() } }
  private let annotationViewSize = CGSize(width: 250, height: 200)
  
  override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
    super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
    configure()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}

private extension CustomAnnotationView {
  func configure() {
    canShowCallout = true
    configureDetailView()
  }
  
  func configureDetailView() {
    guard let annotation = annotation as? StopAnnotation, let id = annotation.id else { return }
    
    let annotationFrameRect = CGRect(origin: .zero, size: annotationViewSize)
    
    let customAnnotationView = UIView()
    customAnnotationView.translatesAutoresizingMaskIntoConstraints = false
    
    let customAnnotationInfoView = UIHostingController(rootView: CustomAnnotationInfoView(id: id, tripListViewModel: TripListViewModel()))
    customAnnotationInfoView.view.translatesAutoresizingMaskIntoConstraints = false
    customAnnotationInfoView.view.frame = customAnnotationView.bounds
    customAnnotationInfoView.view.backgroundColor = .clear
    customAnnotationView.addSubview(customAnnotationInfoView.view)
    
    detailCalloutAccessoryView = customAnnotationView
    NSLayoutConstraint.activate([
      customAnnotationView.widthAnchor.constraint(equalToConstant: annotationFrameRect.width),
      customAnnotationView.heightAnchor.constraint(equalToConstant: annotationFrameRect.height)
    ])
  }
}
