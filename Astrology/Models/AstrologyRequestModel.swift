//
//  AstrologyRequestModel.swift
//  Astrology
//
//  Created by ilkay on 27.10.2020.
//

import Foundation

struct AstrologyRequestModel: Codable {
    
    var day: Int!
    var month: Int!
    var year: Int!
    var hour: Int!
    var min: Int!
    var lat: Float!
    var lon: Float!
    
    init(day: Int, month: Int, year: Int, hour: Int, min: Int, lat: Float, lon: Float!) {
        self.day = day
        self.month = month
        self.year = year
        self.hour = hour
        self.min = min
        self.lat = lat
        self.lon = lon
    }
    
}
