//
//  AlertRequest.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
public struct AlertRequest {
    public var appId: String = Bundle.main.bundleIdentifier ?? String()
    public var route: String
    public var lastAlertId: String = UserDefaults.standard.string(forKey: String.Key.alertId.rawValue) ?? String("1")
    public var deviceUUID: String = UUID().uuidString
    public var sdkVersion: String = "1.0.0"
    
    var dictionary: [String: String] {
        return ["x-app-id": appId,
                "x-last-id": lastAlertId,
                "x-sdk-version": sdkVersion,
                "x-version": "1",
                "x-device-uuid": deviceUUID]
    }
    
    var nsDictionary: NSDictionary {
        return dictionary as NSDictionary
    }
}
