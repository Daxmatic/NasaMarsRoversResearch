//
//  CameraView.swift
//  Nasa Mars Rovers
//
//  Created by Dax Hoes on 04/10/2021.
//

import Combine
import SwiftUI

struct CameraView: View {
    @StateObject private var vm = ManifestViewModelImpl(
        service: ManifestServiceImpl()
    )
    @State var roverName: String
    @State private var currentIndex = 0 /// should be not needed if i can publish the row index to the view.
    var body: some View {
        let camerasOnSol = vm.camerasOnSol

        ScrollViewReader { scrollView in
            VStack {
                List(camerasOnSol) { solDay in
                    DisclosureGroup {
                        ForEach(solDay.cam, id: \.self) { camera in
                            NavigationLink(destination: PhotoView(cameraName: camera, solDay: solDay.id, roverName: roverName)) {
                                Label {
                                    Text("Camera: \(camera.localizedCapitalized.filter { $0 != "_" })")  /// TODO: get the names from the photo model instead of the manifest
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
                        }.id(camerasOnSol.indices)
                    }
                    label: {
                        Row(headline: "Sol: \(solDay.id)", caption: "Date: \(solDay.earthDate)", totPic: "Number of photo's: \(solDay.totalPicOnSol)", image: Image(systemName: "camera.viewfinder"))
                    }
                    .listRowSeparatorTint(.gray)
                }

// MARK: On Top expandable List view TODO Needs to go in its own little place
// MARK: From here we find the "Buttons" to scroll through the lists since some rovers have 3000+ Mars days (Sols ) which is kinda rough to scroll trough
// MARK: the idea is to move this to the modelviewController and update via combine or something like that this is now really shitty code.

                .id(camerasOnSol.indices)
                HStack(alignment: .center) {
                    Button(action: {
                        withAnimation {
                            currentIndex = 0
                            scrollView.scrollTo(0)
                            currentIndex = 0
                        }
                    }) {
                        Image(systemName: "arrow.uturn.left.circle.fill")
                            .renderingMode(.original)
                            .symbolRenderingMode(.hierarchical)
                            .font(.system(size: 18))
                            .foregroundColor(.green)
                    }
                    .padding(.leading)
                    Button(action: {
                        withAnimation {
                            currentIndex -= 8
                            scrollView.scrollTo(currentIndex, anchor: .top)
                        }
                    }) {
                        Image(systemName: "arrow.backward.circle.fill")
                            .renderingMode(.original)
                            .symbolRenderingMode(.hierarchical)
                            .font(.system(size: 18))
                            .foregroundColor(.green)
                    }
                    .padding(24)

                    Button(action: {
                        withAnimation {
                            currentIndex += 8
                            scrollView.scrollTo(currentIndex, anchor: .top)
                        }
                    }) {
                        Image(systemName: "arrow.forward.circle.fill")
                            .renderingMode(.original)
                            .symbolRenderingMode(.hierarchical)
                            .font(.system(size: 18))
                            .foregroundColor(.green)
                    }
                    .padding(24)

                    Button(action: {
                        withAnimation {
                            currentIndex = vm.camerasOnSol.count
                            scrollView.scrollTo(currentIndex)
                        }
                    }) {
                        Image(systemName: "arrow.uturn.right.circle.fill")
                            .renderingMode(.original)
                            .symbolRenderingMode(.hierarchical)
                            .font(.system(size: 18))
                            .foregroundColor(.green)
                    }
                    .padding(.trailing)
                }
// MARK: This is the end of the Button list.
            }
        }
        .task {
            await vm.getManifests()
        }
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
        CameraView(roverName: "perseverance")
    }
}
