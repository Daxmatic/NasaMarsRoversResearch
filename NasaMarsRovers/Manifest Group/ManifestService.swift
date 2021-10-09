//
//  ManifestService.swift
//  Nasa Mars Rovers
//
//  Created by Dax Hoes on 04/10/2021.
//

import Foundation
import SwiftUI
import Combine
protocol ManifestService {
    func fetch() async throws -> ([Manifest],[SolSelectedCameras])
    func fetchURLs(url: URL) async throws -> PhotoResponse
}
enum ManifestServiceError: Error {
    case failed
    case failedToDecode
    case invalidStatusCode
}
final class ManifestServiceImpl: ManifestService {
 

    func fetch() async throws -> ([Manifest],[SolSelectedCameras]) {
        debugPrint("DEBUG: fetch is called")
        let urlSession = URLSession.shared
        let url = URL(string: ApiConstants.manifestBaseUrl.appending("?api_key=5a5bBzC7s2oSRahSUO0ol8nCXhDdMjZrbAXUMpJi"))
        let (data, _) = try await urlSession.data(from: url!)
        guard let json = try? JSONDecoder().decode(Manifest.self, from: data) else {return ([],[])}
        let manifest = json
        let photoList = json.photoManifest.photos
        return ( [manifest] ,photoList)
    }
    func fetchURLs(url: URL) async throws -> PhotoResponse {
        debugPrint("DEBUG: fetchURL Called: shoiuld only happen 1 time per sol ")
        let url = url
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200
        else {
            throw ManifestServiceError.invalidStatusCode
        }
        let decodedData = try JSONDecoder().decode(PhotoResponse.self, from: data)
        // print("\(decodedData)")
        return decodedData
    }
}
