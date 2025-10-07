//
//  AlertRequest.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
import ControlKitBase

public struct AlertRequest: GenericRequest {
    public var appId: String
    public var itemId: String?
    public var extraParameter: String?
    public var route: ControlKitItem = .launch_alert
    public var httpMethod: HTTPMethod = .get
    public var applicationVersion: String = Bundle.main.releaseVersionNumber ?? String()
    public var deviceUUID: String = CKDeviceUUID
    public var sdkVersion: String = launchAlertKit_Version
    
    public var headers: [String: String] {
        return ["x-app-id": appId,
                "x-sdk-version": sdkVersion,
                "x-version": applicationVersion,
                "x-device-uuid": deviceUUID]
    }
    public var body: [String: String] {
        return [:]
    }
}
