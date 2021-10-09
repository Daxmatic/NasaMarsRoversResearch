//
//  PhotoMode;.swift
//  Nasa Mars Rovers
//
//  Created by Dax Hoes on 05/10/2021.
//

import Foundation

// MARK: - PhotoResponse
struct PhotoResponse: Codable, Hashable {
    let photos: [UrlPhotos]
}


// MARK: - Photo
struct UrlPhotos: Codable, Hashable {
    let id, sol: Int
    let camera: CameraComplete
    let imgSrc: String
    let earthDate: String
    let rover: Rover

    enum CodingKeys: String, CodingKey {
        case id, sol, camera
        case imgSrc = "img_src"
        case earthDate = "earth_date"
        case rover
    }
}

// MARK: - Camera
struct CameraComplete: Codable, Hashable,Identifiable {
    let id: Int
    let name: CameraName
    let roverId: Int
    let fullName: FullName

    enum CodingKeys: String, CodingKey {
        case id, name
        case roverId = "rover_id"
        case fullName = "full_name"
    }
}
enum FullName: String, Codable,CaseIterable {
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
}



enum CameraName: String, Codable {
    case edlRucam = "EDL_RUCAM"
    case edlDdcam = "EDL_DDCAM"
    case edlPucam1 = "EDL_PUCAM1"
    case edlPucam2 = "EDL_PUCAM2"
    case edlRdcam = "EDL_RDCAM"
    case frontHazcamLeftA = "FRONT_HAZCAM_LEFT_A"
    case frontHazcamRightA = "FRONT_HAZCAM_RIGHT_A"
    case mczLeft = "MCZ_LEFT"
    case mczRight = "MCZ_RIGHT"
    case navcam = "NAVCAM"
    case navcamLeft = "NAVCAM_LEFT"
    case navcamRight = "NAVCAM_RIGHT"
    case rearHazcamLeft = "REAR_HAZCAM_LEFT"
    case rearHazcamRight = "REAR_HAZCAM_RIGHT"
    case supercamRmi = "SUPERCAM_RMI"
    case skycam = "SKYCAM"
    case sherlockWatson = "SHERLOC_WATSON"
    case fhaz = "FHAZ"
    case rhaz = "RHAZ"
    case mast = "MAST"
    case chemCam = "CHEMCAM"
    case mahli = "MAHLI"
    case mardi = "MARDI"
    case pancam = "PANCAM"
    case minites = "MINITES"

}

// MARK: - Rover
struct Rover: Codable, Hashable {
    let id: Int
    let name: RoverName
    let landingDate, launchDate: String
    let status: Status

    enum CodingKeys: String, CodingKey {
        case id, name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
    }
}

enum RoverName: String, Codable, Hashable {
    case perseverance = "Perseverance"
    case curiosity = "Curiosity"
    case opportunity = "Opportunity"
    case spirit = "Spirit"

}

enum Status: String, Codable, Hashable {
    case active = "active"
}
