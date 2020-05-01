import Foundation
import CoreData

class CoreDataManager {
  
  static let shared = CoreDataManager(managedObjectContext: NSManagedObjectContext.current)
  
  var managedObjectContext: NSManagedObjectContext
  
  private init(managedObjectContext: NSManagedObjectContext) {
    self.managedObjectContext = managedObjectContext
  }
  
  func saveStop(stop: Stop) {
    let currentStop = CurrentStop(context: self.managedObjectContext)
    currentStop.userName = stop.userName
    
    do {
      try self.managedObjectContext.save()
    } catch let error as NSError {
      print(error)
    }
  }
  
  private func fetchStop(id: String) -> CurrentStop? {
    var stops = [CurrentStop]()
    let request: NSFetchRequest<CurrentStop> = CurrentStop.fetchRequest()
    request.predicate = NSPredicate(format: "id == %@", id)
    
    do {
      stops = try self.managedObjectContext.fetch(request)
    } catch let error as NSError {
      print(error)
    }
    
    return stops.first
  }
}
