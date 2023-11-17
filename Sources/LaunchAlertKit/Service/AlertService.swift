//
//  AlertServiceProtocol.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation

public class AlertService: AlertServiceProtocol {
    public init() {}
    public func getAlert(request: AlertRequest) async throws -> AlertResponse {
        do {
            guard let url = URL(string: request.route) else {
                return AlertResponse(hasAlert: false)
            }
            var request = URLRequest(url: url)
            request.setValue(
                "application/json",
                forHTTPHeaderField: "Content-Type"
            )
            let (data, _) = try await URLSession.shared.data(for: request)
            if let AlertResponse = try? JSONDecoder().decode(AlertResponse.self, from: data) {
                print(AlertResponse)
                return AlertResponse
            } else {
                print("Invalid Response")
                return AlertResponse(hasAlert: false)
            }
        } catch {
            print("Failed to Send POST Request \(error)")
            return AlertResponse(hasAlert: false)
        }
    }
}
