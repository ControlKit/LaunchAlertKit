//
//  UpdateResponse.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation

public typealias AlertLocalString = [AlertLocalizedText]

public struct AlertResponse: Codable {
    public var data: AlertModel?
}
public struct AlertModel: Codable {
    public let id: String
    public let title: AlertLocalString?
    public let description: AlertLocalString?
    public let icon: String?
    public let link: String?
    public let button_title: AlertLocalString?
    public let cancel_button_title: AlertLocalString?
    public let sdk_version: String?
    public let minimum_version: String?
    public let maximum_version: String?
    public let created_at: String?
}
public struct AlertLocalizedText: Codable {
    public let language: String?
    public let content: String?
}
