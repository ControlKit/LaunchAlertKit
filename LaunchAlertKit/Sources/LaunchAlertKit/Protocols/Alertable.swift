//
//  Alerttable.swift
//
//
//  Created by Maziar Saadatfar on 10/11/23.
//

import Foundation

public protocol Alertable: AnyObject {
    var alertService: AlertServiceProtocol! { get }
    func getAlert(request: AlertRequest) async throws -> AlertResponse
}

extension Alertable {
    public func getAlert(request: AlertRequest) async throws -> AlertResponse {
        return try await alertService.getAlert(request: request)
    }
}
