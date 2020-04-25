import Foundation

struct Trip: Decodable  {
  let status: String
  let origin: Origin
  let stops: [Stops]
  let destination: Destination
  let endTime: String
  let startTime: String
  let description: String
  let driverName: String
  let route: String
}

struct Origin: Decodable {
  let address: String
  let point: Point
}

struct Stops: Decodable {
  let point: Point
  let id: Int
}

struct Destination: Decodable {
  let address: String
  let point: Point
}

struct Point: Decodable {
  let _latitude: Double
  let _longitude: Double
}
