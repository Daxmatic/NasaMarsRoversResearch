//
//  ManifestViewModel.swift
//  Nasa Mars Rovers
//
//  Created by Dax Hoes on 04/10/2021.
//

import Foundation
import SwiftUI
import Combine
protocol ManifestViewModel: ObservableObject {
    func getManifests() async
}

@MainActor
final class ManifestViewModelImpl: ManifestViewModel {
    @Published private(set) var manifests: [PhotoManifest] = []
    @Published private(set) var photoList: [SolSelectedCameras] = []
    @Published private(set) var camerasOnSol: [CamerasOnSol] = []
    private let service: ManifestService
    private weak var publish: AnyCancellable?

    init(service: ManifestService) {
        self.service = service
        
    }

    func getManifests() async {
        
        do {
            let jsonResponse = try await service.fetch()
            manifests = jsonResponse.0.compactMap {$0.photoManifest}
            photoList = jsonResponse.1.map({ $0 })
            for k in photoList {
                let item = CamerasOnSol(sol: k.sol, earthDate: k.earthDate, totalPicOnSol: k.totalPhotos, cam: k.cameras.compactMap { $0.rawValue })
                camerasOnSol.append(item)
            }
            return

        } catch {
            print(error)
        }
    }
    
}

