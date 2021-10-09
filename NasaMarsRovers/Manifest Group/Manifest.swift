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

enum SimpleCameraName: String, Codable, Hashable, CaseIterable {
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
    case sherlockWatson = "SHERLOC_WATSON"
    case skycam = "SKYCAM"
    case supercamRmi = "SUPERCAM_RMI"
    case chemCam = "CHEMCAM"
    case fhaz = "FHAZ"
    case mahli = "MAHLI"
    case mardi = "MARDI"
    case mast = "MAST"
    case navcam = "NAVCAM"
    case rhaz = "RHAZ"
    case entry = "ENTRY"
    case minites = "MINITES"
    case pancam = "PANCAM"

    func cameraNameTypes() -> String {
        switch self {
            case .edlRucam:
                return "Rover Up-Look Camera"
            case .edlDdcam:
                return "Descent Stage Down-Look Camera"
            case .edlPucam1:
                return "Parachute Up-Look Camera A"
            case .edlPucam2:
                return "Parachute Up-Look Camera B"
            case .edlRdcam:
                return "Rover Down-Look Camera"
            case .frontHazcamLeftA:
                return "Front Hazard Avoidance Camera - Left"
            case .frontHazcamRightA:
                return "Front Hazard Avoidance Camera - Right"
            case .mczLeft:
                return "Mast Camera Zoom - Left"
            case .mczRight:
                return "Mast Camera Zoom - Right"
            case .navcam:
                return "Navigation Camera"
            case .navcamLeft:
                return "Navigation Camera - Left"
            case .navcamRight:
                return "Navigation Camera - Right"
            case .rearHazcamLeft:
                return "Rear Hazard Avoidance Camera - Left"
            case .rearHazcamRight:
                return "Rear Hazard Avoidance Camera - Right"
            case .supercamRmi:
                return "Super Camera RMI"
            case .skycam:
                return "MEDA Skycam"
            case .sherlockWatson:
                return "SHERLOC WATSON Camera"
            case .fhaz:
                return "Front Hazard Avoidance Camera"
            case .rhaz:
                return "Rear Hazard Avoidance Camera"
            case .mast:
                return "Mast Camera"
            case .chemCam:
                return "Chemistry and Camera Complex"
            case .mahli:
                return "Mars Hand Lens Imager"
            case .mardi:
                return "Mars Descent Imager"
            case .pancam:
                return "Panoramic Camera"
            case .minites:
                return "Miniature Thermal Emission Spectrometer (Mini-TES)"
        }
    }
    /*
     case edlRucam = "Rover Up-Look Camera"
     case edlDdcam = "Descent Stage Down-Look Camera"
     case edlPucam1 = "Parachute Up-Look Camera A"
     case edlPucam2 = "Parachute Up-Look Camera B"
     case edlRdcam = "Rover Down-Look Camera"
     case frontHazcamLeftA = "Front Hazard Avoidance Camera - Left"
     case frontHazcamRightA = "Front Hazard Avoidance Camera - Right"
     case mczLeft = "Mast Camera Zoom - Left"
     case mczRight = "Mast Camera Zoom - Right"
     case navcam = "Navigation Camera"
     case navcamLeft = "Navigation Camera - Left"
     case navcamRight = "Navigation Camera - Right"
     case rearHazcamLeft = "Rear Hazard Avoidance Camera - Left"
     case rearHazcamRight = "Rear Hazard Avoidance Camera - Right"
     case supercamRmi = "Super Camera RMI"
     case skycam = "MEDA Skycam"
     case sherlockWatson = "SHERLOC WATSON Camera"
     case fhaz = "Front Hazard Avoidance Camera"
     case rhaz = "Rear Hazard Avoidance Camera"
     case mast = "Mast Camera"
     case chemCam = "Chemistry and Camera Complex"
     case mahli = "Mars Hand Lens Imager"
     case mardi = "Mars Descent Imager"
     case pancam = "Panoramic Camera"
     case minites = "Miniature Thermal Emission Spectrometer (Mini-TES)"
     */
}

struct CameraNames: Codable, Identifiable {
    var id = UUID()
    let name, fullName: String

    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
    }
}
