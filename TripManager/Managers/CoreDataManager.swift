import Foundation
import CoreData

class CoreDataManager {
  
  static let shared = CoreDataManager(managedObjectContext: NSManagedObjectContext.current)
  
  var managedObjectContext: NSManagedObjectContext
  
  private init(managedObjectContext: NSManagedObjectContext) {
    self.managedObjectContext = managedObjectContext
  }
  
  func saveReport(name: String, surname: String, email: String, phone: String, date: Date, description: String) {
    let report = Report(context: self.managedObjectContext)
    report.name = name
    report.surname = surname
    report.email = email
    report.phone = phone
    report.date = date
    report.reportDescription = description
    do {
      try self.managedObjectContext.save()
    } catch let error as NSError {
      print(error)
    }
  }
  
  func fetchAllReport() -> [Report] {
    var reports = [Report]()
    let request: NSFetchRequest<Report> = Report.fetchRequest()
    do {
      reports = try self.managedObjectContext.fetch(request)
    } catch let error as NSError {
      print(error)
    }
    return reports
  }
}
