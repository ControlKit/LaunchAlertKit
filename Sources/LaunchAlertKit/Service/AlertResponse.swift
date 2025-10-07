//
//  UpdateResponse.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//
import Foundation
import ControlKitBase
public struct AlertResponse: Codable {
    public var data: AlertModel?
}
public struct AlertModel: Codable {
    public let id: String
    public let title: LocalString?
    public let description: LocalString?
    public let icon: String?
    public let link: String?
    public let button_title: LocalString?
    public let cancel_button_title: LocalString?
    public let sdk_version: String?
    public let minimum_version: String?
    public let maximum_version: String?
    public let created_at: String?
}
