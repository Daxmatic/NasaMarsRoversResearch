//
//  ModelResponse.swift
//  URLComponentsResearch
//
//  Created by Dax Hoes on 04/10/2021.
//

import SwiftUI


// MARK: - Manifest
struct Manifest: Codable, Hashable {
    let photoManifest: PhotoManifest

    enum CodingKeys: String, CodingKey {
        case photoManifest = "photo_manifest"
    }
}

// MARK: - PhotoManifest
struct PhotoManifest: Codable, Hashable {
    let name, landingDate, launchDate, status: String
    let maxSol: Int
    let maxDate: String
    let totalPhotos: Int
    let photos: [SolSelectedCameras]

    enum CodingKeys: String, CodingKey {
        case name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
        case maxSol = "max_sol"
        case maxDate = "max_date"
        case totalPhotos = "total_photos"
        case photos
    }
}

// MARK: - Photo
struct SolSelectedCameras: Codable, Hashable {
    let sol: Int
    let earthDate: String
    let totalPhotos: Int
    let cameras: [SimpleCameraName]

    enum CodingKeys: String, CodingKey {
        case sol
        case earthDate = "earth_date"
        case totalPhotos = "total_photos"
        case cameras
    }
}

enum SimpleCameraName: String, Codable, Hashable,CaseIterable {
    case edlDdcam = "EDL_DDCAM"
    case edlPucam1 = "EDL_PUCAM1"
    case edlPucam2 = "EDL_PUCAM2"
    case edlRdcam = "EDL_RDCAM"
    case edlRucam = "EDL_RUCAM"
    case frontHazcamLeftA = "FRONT_HAZCAM_LEFT_A"
    case frontHazcamRightA = "FRONT_HAZCAM_RIGHT_A"
    case mczLeft = "MCZ_LEFT"
    case mczRight = "MCZ_RIGHT"
    case navcamLeft = "NAVCAM_LEFT"
    case navcamRight = "NAVCAM_RIGHT"
    case rearHazcamLeft = "REAR_HAZCAM_LEFT"
    case rearHazcamRight = "REAR_HAZCAM_RIGHT"
    case sherlocWatson = "SHERLOC_WATSON"
    case skycam = "SKYCAM"
    case supercamRmi = "SUPERCAM_RMI"
    case chemcam = "CHEMCAM"
    case fhaz = "FHAZ"
    case mahli = "MAHLI"
    case mardi = "MARDI"
    case mast = "MAST"
    case navcam = "NAVCAM"
    case rhaz = "RHAZ"
    case entry = "ENTRY"
    case minites = "MINITES"
    case pancam = "PANCAM"
}

struct CameraNames: Codable, Identifiable {
    var id = UUID()
    let name, fullName: String

    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
    }
}

