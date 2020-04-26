import Foundation

class WebService {
  
  func getTrips(completion: @escaping (([Trip]?) -> Void)) {
    guard let url = URL(string: Constants.url + Constants.tripEndpoint) else {
      fatalError("Url is not correct")
    }
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard let data = data, error == nil else {
        DispatchQueue.main.async {
          completion(nil)
        }
        return
      }
      do {
        let trips = try JSONDecoder().decode([Trip].self, from: data)
        DispatchQueue.main.async {
          completion(trips)
        }
      } catch {
        print(error)
      }
    }.resume()
  }
}
