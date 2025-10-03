//
//  AlertServiceProtocol.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation

public class AlertService: AlertServiceProtocol {
    public init() {}
    public func getAlert(request: AlertRequest) async throws -> AlertResponse? {
        do {
            guard let url = URL(string: request.route) else {
                return AlertResponse()
            }
            var req = URLRequest(url: url)
            req.allHTTPHeaderFields = request.dictionary
            req.setValue(
                "application/json",
                forHTTPHeaderField: "Content-Type"
            )
            let (data, res) = try await URLSession.shared.data(for: req)
            if (res as? HTTPURLResponse)?.statusCode == 204 {
                print("Launch Alert Response --> 204")
                return nil
            }
            if let response = try? JSONDecoder().decode(AlertResponse.self, from: data) {
                print("Launch Alert Response --> 200")
                print(response)
                return response
            } else {
                print("Launch Alert Response --> Decode Error")
                return nil
            }
        } catch {
            print("Failed to Launch alert Request \(error)")
            return nil
        }
    }
}
