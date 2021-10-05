//
//  PhotoView.swift
//  Nasa Mars Rovers
//
//  Created by Dax Hoes on 04/10/2021.
//

import SwiftUI

struct PhotoView: View {
    @StateObject private var vm = PhotoViewModel(
        service: ManifestServiceImpl()
    )
    @State var cameraName: String
    @State var solDay: Int
    @State var roverName: String
    @State private var scrollTarget: Int?
    @State private var currentIndex = 0
    var body: some View {
        VStack {
            switch vm.state {
                case .success:
                    let children = vm.photoUrlList
                    let columns: [GridItem] =
                        Array(repeating: .init(.flexible()), count: 2)
                    ScrollView {
                        ScrollViewReader { scrollView in
                            Spacer()
                            LazyVGrid(columns: columns) {
                                ForEach(children) { item in
                                    LazyVStack {
                                        Text("Sol: \(solDay) \(item.pictureList.count)")
                                        Text("Camera: \(cameraName)")
                                            .font(.caption)

                                        NavigationLink(destination: PhotoDetailView(url: item.pictureList)) {
                                            AsyncImage(url: URL(string: item.pictureList)) { phase in
                                                if let image = phase.image {
                                                    image.resizable() // Displays the loaded image.
                                                } else if phase.error != nil {
                                                    Color.red // Indicates an error.
                                                } else {
                                                    ProgressView()
                                                    Color.blue // Acts as a placeholder.
                                                }
                                            }
                                        }
                                        .frame(width: 168, height: 180)
                                        .font(.footnote)
                                        .buttonStyle(PlainButtonStyle())
                                        .frame(width: 216, height: 216, alignment: .center)
                                    }.id(UUID())

                                }.id(UUID())

                            }.id(UUID())
                            Spacer(minLength: 100)
                            HStack(alignment: .center) {
                                Button(action: {
                                    withAnimation {
                                        currentIndex = 0
                                        scrollView.scrollTo(0)
                                        // currentIndex = 0
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
                                        currentIndex -= 2
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
                                        currentIndex += 2
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
                                        currentIndex = children.endIndex
                                        scrollView.scrollTo(currentIndex)
                                    }
                                }) {
                                    Image(systemName: "arrow.uturn.right.circle.fill")
                                        .renderingMode(.original)
                                        .symbolRenderingMode(.hierarchical)
                                        .font(.system(size: 18))
                                        .foregroundColor(.green)
                                }
                            }
                            .id(solDay)

                            .padding(.bottom)

                            .font(.caption)
                        }
                    }
                case .loading:
                    ProgressView()
                default:
                    EmptyView()
            }
        }
        .task {
            await vm.getURLs(url: URL(string: "https://api.nasa.gov/mars-photos/api/v1/rovers/\(roverName)/photos?sol=\(solDay)&camera=\(cameraName)&api_key=5a5bBzC7s2oSRahSUO0ol8nCXhDdMjZrbAXUMpJi")!)
            // print("STATE \(vm.state)")
        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(cameraName: "edl_ddcam", solDay: 1, roverName: "perseverance")
    }
}
