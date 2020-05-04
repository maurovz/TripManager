import UIKit

class ContactFormViewModel: ObservableObject {
  @Published var validationErrors = [ValidationError]()
  @Published var name: String = ""
  var showReportView: Bool = false
  var surname: String = ""
  var email: String = ""
  var phone: String = ""
  var description: String = ""
  var date: Date = Date()
  
  
  func validateFormFields() -> [ValidationError] {
    validationErrors.removeAll()
    if (!isStringLenghtValid(string: name, maximum: 100, minimum: 1)) {
      validationErrors.append(ValidationError(fieldName: "name", validationMessage: "Name should have at least one character"))
    }
    if (!isStringLenghtValid(string: surname, maximum: 100, minimum: 1)) {
      validationErrors.append(ValidationError(fieldName: "surname", validationMessage: "Surname should have at least one character"))
    }
    if (!isStringLenghtValid(string: description, maximum: 200, minimum: 1)) {
      validationErrors.append(ValidationError(fieldName: "description", validationMessage: "Description should have no more than 200 characters"))
    }
    
    if !isValidEmail(email) {
      validationErrors.append(ValidationError(fieldName: email, validationMessage: "Email format is not valid"))
    }
    return validationErrors
  }
  
  func isStringLenghtValid(string: String, maximum: Int, minimum: Int) -> Bool {
    if string.count > minimum && string.count < maximum {
      return true
    } else {
      return false
    }
  }
  
  func isValidEmail(_ email: String) -> Bool {
      let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

      let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
      return emailPred.evaluate(with: email)
  }
  
  func saveReport() {
    CoreDataManager.shared.saveReport(name: name, surname: surname, email: email, phone: phone, date: date, description: description)    
    UIApplication.shared.applicationIconBadgeNumber = fetchAllReports().count
  }
  
  func fetchAllReports() -> [Report] {
    CoreDataManager.shared.fetchAllReport()
  }
}
