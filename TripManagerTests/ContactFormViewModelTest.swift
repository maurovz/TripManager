import XCTest
@testable import TripManager

class ContactFormViewModelTest: XCTestCase {
  private var contactFormViewModel: ContactFormViewModel!
  
  override func setUp() {
    super.setUp()
    fillReportData()
  }
  
  func fillReportData() {
    self.contactFormViewModel = ContactFormViewModel()
    self.contactFormViewModel.name = "marcos@gmail.com"
    self.contactFormViewModel.surname = "marcos@gmail.com"
    self.contactFormViewModel.email = "marcos@gmail.com"
    self.contactFormViewModel.phone = "marcos@gmail.com"
    self.contactFormViewModel.description = "marcos@gmail.com"
    self.contactFormViewModel.date = Date()
  }
  
  func test_that_new_report_is_saved() {
    let reportCount = self.contactFormViewModel.fetchAllReports().count
    self.contactFormViewModel.saveReport()
    XCTAssertEqual(self.contactFormViewModel.fetchAllReports().count, reportCount + 1)
  }
}
