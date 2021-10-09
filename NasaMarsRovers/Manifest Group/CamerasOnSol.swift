//
//  CamerasOnSol.swift
//  Nasa Mars Rovers
//
//  Created by Dax Hoes on 04/10/2021.
//

import Foundation

struct CamerasOnSol: Identifiable {
    var id: Int { sol }
    var sol: Int
    var earthDate: String
    var totalPicOnSol: Int
    var camera: [String]
    var full: [String]
   // var combine: ([String],[String])
    var children: [CamerasOnSol]? = nil
}

struct PhotoUrlList: Identifiable {
    var id: Int
    var pictureList: String
    var fullName: String
    var name: String
    var children: [PhotoUrlList]? = nil
}

enum FullName: String, Codable, CaseIterable {
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
