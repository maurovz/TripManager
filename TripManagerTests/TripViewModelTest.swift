import XCTest
@testable import TripManager

class TripViewModelTest: XCTestCase {
  private var tripViewModel: TripViewModel!
  
  override func setUp() {
    super.setUp()
    let point = Point(_latitude: 30.0, _longitude: 50.0)
    let stop = StopInfo(point: point, id: 40)
    let origin = Origin(address: "Centro Madrid", point: point)
    let destination = Destination(address: "Ciudad Naranja", point: point)
    let trip = Trip(status: "Active", origin: origin, stops: [stop], destination: destination, endTime: "10", startTime: "30", description: "Barcelona Trip", driverName: "Hernando", route: "polyline")
    tripViewModel = TripViewModel(trip: trip)
  }
  
  func test_shoul_make_sure_trip_status_is_active() throws {
    XCTAssertEqual(self.tripViewModel.status, "Active")
  }
  
  func test_should_make_sure_origin_address_is_correct() {
    XCTAssertEqual(self.tripViewModel.origin.address, "Centro Madrid")
  }
  
  func test_should_make_sure_origin_address_latitude_is_correct() {
    XCTAssertEqual(self.tripViewModel.origin.point._latitude, 30.0)
  }
  
  func test_should_make_sure_origin_address_longitude_is_correct() {
    XCTAssertEqual(self.tripViewModel.origin.point._longitude, 50.0)
  }

  
  func test_should_make_sure_stops_count_is_correct() {
    XCTAssertEqual(self.tripViewModel.stops?.count, 1)
  }
  
  func test_should_make_sure_destination_address_longitude_is_correct() {
    XCTAssertEqual(self.tripViewModel.destination.point._longitude, 50.0)
  }
  
  func test_should_make_sure_start_time_is_correct() {
    XCTAssertEqual(self.tripViewModel.startTime, "30")
  }
  
  func test_should_make_sure_end_time_is_correct() {
    XCTAssertEqual(self.tripViewModel.endTime, "10")
  }
  
  func test_should_make_sure_description_is_correct() {
    XCTAssertEqual(self.tripViewModel.description, "Barcelona Trip")
  }
  
  func test_should_make_sure_driver_name_is_correct() {
    XCTAssertEqual(self.tripViewModel.driverName, "Hernando")
  }
}
