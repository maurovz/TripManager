import Foundation

struct Stop: Decodable {
  let stopTime: String
  let paid: Bool
  let address: String
  let tripId: Int
  let userName: String
  let point: Point
  let price: Double
}
