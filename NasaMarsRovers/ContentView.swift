//
//  ContentView.swift
//  NasaMarsRovers
//
//  Created by Dax Hoes on 05/10/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      //  NavigationView {
            CameraView(roverName:"Perseverance")
                .navigationTitle("Mars Rovers")
       // }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
