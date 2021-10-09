//
//  ApiConstants.swift
//  Nasa Mars Rovers
//
//  Created by Dax Hoes on 04/10/2021.
//

import Foundation
enum ApiConstants {
    static let roverName = "perseverance"
    //static let sol = "\(solDay)"
    static let manifestBaseUrl = "https://api.nasa.gov/mars-photos/api/v1/manifests/\(roverName)"
    static let photoBaseUrl = "https://api.nasa.gov/mars-photos/api/v1/rovers/\(roverName)/"
}
