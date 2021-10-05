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
    private let service: ManifestService

    init(service: ManifestService) {
        self.service = service
    }

    func getURLs(url: URL) async {
        self.state = .loading
        do {
            let urls = try await service.fetchURLs(url: url)
            self.state = .success(data: urls)
        } catch {
            self.state = .failed(error: error)
        }
        
    }
}

