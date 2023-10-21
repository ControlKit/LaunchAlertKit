//
//  UpdateResponse.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation

public struct AlertResponse: Codable {
    public var version: String?
    public let forceAlert: Bool
    public var title: String?
    public var description: String?
    public var iconUrl: String?
    public var linkUrl: String?
    public var buttonTitle: String?
}
