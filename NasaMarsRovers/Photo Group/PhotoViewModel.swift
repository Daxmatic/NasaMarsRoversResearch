//
//  PhotoViewModel.swift
//  Nasa Mars Rovers
//
//  Created by Dax Hoes on 04/10/2021.
//

import SwiftUI

@MainActor
class PhotoViewModel: ObservableObject {
    enum State {
        case na
        case loading
        case success(data: PhotoResponse)
        case failed(error: Error)
    }

    @Published private(set) var state: State = .na
    @Published private(set) var photoUrlList: [PhotoUrlList] = []
    private let service: ManifestService

    init(service: ManifestService) {
        self.service = service
    }

    func getURLs(url: URL) async {
        self.state = .loading
        do {
            self.photoUrlList.removeAll(keepingCapacity: true)
            debugPrint("DEBUG: photoUrlList removeAll Called \(url)")
            let urls = try await service.fetchURLs(url: url)
            self.state = .success(data: urls)
            for k in urls.photos {
                let item = PhotoUrlList(id: k.id, pictureList: k.imgSrc, fullName: k.camera.fullName.rawValue, name: k.camera.name.rawValue, children: [PhotoUrlList(id: k.id, pictureList: k.imgSrc, fullName: k.camera.fullName.rawValue, name: k.camera.name.rawValue)])
                self.photoUrlList.append(item)
            }
            print("\( photoUrlList   )")
            return
        } catch {
            self.state = .failed(error: error)
        }
    }
}
