//
//  AlertServiceProtocol.swift
//  
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation

public protocol AlertServiceProtocol {
    func getAlert(request: AlertRequest) async throws -> AlertResponse?
}
