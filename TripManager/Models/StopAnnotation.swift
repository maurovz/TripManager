import Foundation
import MapKit

final class StopAnnotation: NSObject, MKAnnotation {
    
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(tripStop: TripStop) {
        self.title = tripStop.name
        self.coordinate = tripStop.coordinate
    }
    
}
