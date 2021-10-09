//
//  CamerasOnSol.swift
//  Nasa Mars Rovers
//
//  Created by Dax Hoes on 04/10/2021.
//

import Foundation


struct CamerasOnSol: Identifiable {
    var id: Int {sol}
    var sol: Int
    var earthDate: String
    var totalPicOnSol: Int
    var camera: [String]
    var children: [CamerasOnSol]? = nil
}

struct PhotoUrlList: Identifiable {
    var id: Int
    var pictureList: String
    var fullName: FullName.RawValue
    var name: CameraName.RawValue
    var children: [PhotoUrlList]? = nil
}


