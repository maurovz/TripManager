import Foundation

class ContactFormViewModel: ObservableObject {
  var name: String = ""
  var surname: String = ""
  var email: String = ""
  var phone: String = ""
  var description: String = ""
  var date: Date = Date()
  
  func saveReport() {
//    CoreDataManager.shared.saveStop(stop: stop)
  }
}
