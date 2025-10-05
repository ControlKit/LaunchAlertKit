//
//  ActionRequest.swift
//  AgreementKit
//
//  Created by Maziar Saadatfar on 9/1/25.
//
import Foundation
public struct ActionRequest {
    public var appId: String
    public var alertId: String
    public var action: AlertAction
    public var route: String = "https://tauri.ir/api/launch-alert/"
    public var deviceUUID: String = UUID().uuidString
    public var sdkVersion: String = launchAlertKit_Version
    public var applicationVersion: String = Bundle.main.releaseVersionNumber ?? String()
    
    var headers: [String: String] {
        return ["x-app-id": appId,
                "x-sdk-version": sdkVersion,
                "x-version": applicationVersion,
                "x-device-uuid": deviceUUID]
    }
    
    var params: [String: String] {
        return [
            "action": action.rawValue
        ]
    }
}

public enum AlertAction: String {
    case view = "VIEW"
    case accepted = "ACCEPTED"
    case canceled = "CANCELED"
}
  
