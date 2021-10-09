//
//  NasaMarsRoversApp.swift
//  NasaMarsRovers
//
//  Created by Dax Hoes on 05/10/2021.
//

import SwiftUI

@main
struct NasaMarsRoversApp: App {
    @StateObject private var vm = ManifestViewModelImpl(
        service: ManifestServiceImpl()
    )
    var body: some Scene {
        WindowGroup {
            ZStack {
            CameraView(roverName: "perseverance")
                .environmentObject(vm)

        }.task {
            await vm.getManifests()
        }
        }
    }
}
