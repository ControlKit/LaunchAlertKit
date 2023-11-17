//
//  AlertRequest.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
public struct AlertRequest {
    public var appId: String = Bundle.main.bundleIdentifier ?? String()
    public var appVersion: String = Bundle.main.releaseVersionNumber ?? String()
    public var version: String = UserDefaults.standard.string(forKey: String.Key.alertVersion.rawValue) ?? String()
    public var route: String
    public var os: String = "iOs"
    public var language: String = "en"
    
    var dictionary: [String: Any] {
        return ["appId": appId,
                "appVersion": appVersion,
                "version": version,
                "os": os,
                "lang": language]
    }
    
    var nsDictionary: NSDictionary {
        return dictionary as NSDictionary
    }
}
