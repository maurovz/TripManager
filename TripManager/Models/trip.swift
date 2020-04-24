//
//  trip.swift
//  TripManager
//
//  Created by Mauricio Vazquez on 4/24/20.
//  Copyright © 2020 CoderCamp. All rights reserved.
//

import Foundation

struct Trip  {
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

struct Origin {
  let address: String
  let point: Point
}

struct Stops {
  let point: Point
  let id: Int
}

struct Destination {
  let address: String
  let point: Point
}

struct Point {
  let _latitude: Double
  let _longitude: Double
}
