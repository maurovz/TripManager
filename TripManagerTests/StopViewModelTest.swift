import XCTest
@testable import TripManager

class StopViewModelTest: XCTestCase {
  private var stopViewModel: StopViewModel!
  
  override func setUp() {
    super.setUp()
    let point = Point(_latitude: 70.0, _longitude: 200.0)
    let stop = Stop(stopTime: "19", paid: false, address: "Sevilla Road", tripId: 165, userName: "carlos", point: point, price: 500.8)
    self.stopViewModel = StopViewModel(stop: stop)
  }
  
  func test_should_make_sure_trip_is_paid() {
    XCTAssertEqual(self.stopViewModel.paid, false)
  }
  
  func test_should_make_sure_stop_time_is_correct() {
    XCTAssertEqual(self.stopViewModel.stopTime, "19")
  }
  
  func test_should_make_sure_address_is_correct() {
    XCTAssertEqual(self.stopViewModel.address, "Sevilla Road")
  }
  
  func test_should_make_sure_trip_id_is_correct() {
    XCTAssertEqual(self.stopViewModel.tripId, 165)
  }
  
  func test_should_make_sure_trip_username_is_correct() {
    XCTAssertEqual(self.stopViewModel.username, "carlos")
  }
}
