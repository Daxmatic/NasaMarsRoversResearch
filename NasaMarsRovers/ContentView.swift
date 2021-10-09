//
//  ContentView.swift
//  NasaMarsRovers
//
//  Created by Dax Hoes on 05/10/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ManifestViewModelImpl(
        service: ManifestServiceImpl()
    )
    var body: some View {
      //  NavigationView {
        ZStack {
            CameraView(vm: EnvironmentObject(), pm: PhotoViewModel(service: ManifestServiceImpl()), roverName: "Perseverance", solDay: 0)
                    // .navigationTitle("Mars Rovers")
       }.environmentObject(ManifestViewModelImpl(service: ManifestServiceImpl()))
                .task {
                    
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ManifestViewModelImpl(service: ManifestServiceImpl()))
    }
}
