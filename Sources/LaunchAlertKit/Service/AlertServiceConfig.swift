//
//  AlertServiceConfig.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
public struct AlertServiceConfig {
    public init(style: LaunchAlertViewStyle = .fullscreen1,
                appId: String,
                language: String,
                version: String) {
        self.viewConfig = LaunchAlertViewStyle.getViewConfigWithStyle(style: style, lang: language)
        self.appId = appId
        self.version = version
    }
    public var route: String = "https://tauri.ir/api/launch-alert"
    public var appId: String = "9fb42682-ebd0-4553-a131-2620ca7f2f63" //Bundle.main.bundleIdentifier ?? String()
    public var version: String = "1"//Bundle.main.releaseVersionNumber ?? String()
    public var sdkVersion: String = "1.0.0"
    public var viewConfig: LaunchAlertViewConfig
}
