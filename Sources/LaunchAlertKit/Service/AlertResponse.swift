//
//  UpdateResponse.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation

public struct AlertResponse: Codable {
    public var version: String?
    public var closeButtonTitle: String?
    public var title: String?
    public var description: String?
    public var iconUrl: String?
    public var linkUrl: String?
    public var buttonTitle: String?
    public var hasAlert: Bool = false
}
