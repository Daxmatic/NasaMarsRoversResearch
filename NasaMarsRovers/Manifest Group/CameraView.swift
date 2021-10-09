//
//  CameraView.swift
//  Nasa Mars Rovers
//
//  Created by Dax Hoes on 04/10/2021.
//

import Combine
import SwiftUI

struct CameraView: View, Equatable {
    @EnvironmentObject var vm: ManifestViewModelImpl
    @StateObject var pm = PhotoViewModel(
        service: ManifestServiceImpl()
    )
    @State var roverName: String
    @State var solDay: Int = 0
    // @State private var currentIndex = 0 /// should be not needed if i can publish the row index to the view.
    var body: some View {
        let camerasOnSol = vm.camerasOnSol
        NavigationView {
            ScrollViewReader { _ in
                VStack {
                    List(camerasOnSol) { solDay in
                        DisclosureGroup {
                            ForEach(Array(zip(solDay.camera, solDay.full)), id: \.0) { camera in
                                NavigationLink(destination: PhotoView(cameraName: "\(camera.0)", solDay: solDay.id, roverName: roverName)) {
                                    Label {
                                        Text("\(camera.1)")
                                            .font(.body)
                                            .foregroundColor(.primary)
                                        Text("Number of photo's: \(solDay.totalPicOnSol)")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    } icon: {
                                        Image(systemName: "camera.aperture")
                                            .renderingMode(.original)
                                            .symbolRenderingMode(.hierarchical)
                                            .foregroundColor(.green)
                                    }
                                }

                            }.id(UUID())
                        }
                        label: {
                            Row(headline: "Sol: \(solDay.id)", caption: "Date: \(solDay.earthDate)", totPic: "Number of photo's: \(solDay.totalPicOnSol)", image: Image(systemName: "camera.viewfinder"))
                        }
                        .listRowSeparatorTint(.gray)
                    }.id(UUID())

                        // MARK: On Top expandable List view TODO Needs to go in its own little place

                        // MARK: From here we find the "Buttons" to scroll through the lists since some rovers have 3000+ Mars days (Sols ) which is kinda rough to scroll trough

                        // MARK: the idea is to move this to the modelviewController and update via combine or something like that this is now really shitty code.

                        .id(camerasOnSol.indices)

                    // MARK: This is the end of the Button list.
                }
            }
        }.environmentObject(vm)
            .task {
                await pm.getURLs(url: URL(string: "https://api.nasa.gov/mars-photos/api/v1/rovers/\(roverName)/photos?sol=\(solDay)&api_key=5a5bBzC7s2oSRahSUO0ol8nCXhDdMjZrbAXUMpJi")!)
            }
    }

    static func == (lhs: CameraView, rhs: CameraView) -> Bool {
        print("LHS RHS Called maar hij word niet echt gecalled??")
        return lhs.roverName == rhs.roverName
    }
}

// MARK: CameraRow View perhaps i will move that to another file and have a look if i can share the rowview

extension CameraView {
    struct Row: View {
        let headline: String
        let caption: String
        let totPic: String
        let image: Image

        var body: some View {
            HStack(spacing: 12.0) {
                image
                    .renderingMode(.original)
                    .symbolRenderingMode(.hierarchical)
                    .resizable()
                    .frame(width: 24.0, height: 24.0)
                    .padding(12.0)
                    .background(.tertiary)
                    .foregroundColor(.green)

                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(headline)
                        .font(.headline)
                    Text(caption)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(totPic)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.vertical, 2.0)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/ .dark/*@END_MENU_TOKEN@*/)
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView(vm: EnvironmentObject(), pm: PhotoViewModel(service: ManifestServiceImpl()), roverName: "Perseverance", solDay: 0).environmentObject(ManifestViewModelImpl(service: ManifestServiceImpl()))
    }
}
