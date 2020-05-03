import UIKit

class ContactFormViewModel: ObservableObject {
  var name: String = ""
  var surname: String = ""
  var email: String = ""
  var phone: String = ""
  var description: String = ""
  var date: Date = Date()
  
  func saveReport() {
    CoreDataManager.shared.saveReport(name: name, surname: surname, email: email, phone: phone, date: date, description: description)    
    UIApplication.shared.applicationIconBadgeNumber = fetchAllReports().count
  }
  
  func fetchAllReports() -> [Report] {
    CoreDataManager.shared.fetchAllReport()
  }
}
