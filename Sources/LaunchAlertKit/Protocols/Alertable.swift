//
//  Alerttable.swift
//
//
//  Created by Maziar Saadatfar on 10/11/23.
//

import Foundation
import ControlKitBase

public protocol Alertable: AnyObject {
    var alertService: GenericServiceProtocol! { get }
    func getAlert(request: AlertRequest) async throws -> Result<AlertResponse>?
}

extension Alertable {
    public func getAlert(request: AlertRequest) async throws -> Result<AlertResponse>? {
        let response : Result<AlertResponse> = try await alertService.execute(request: request)
        return response
    }
}
