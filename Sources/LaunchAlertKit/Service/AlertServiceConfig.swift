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
        self.applicationVersion = version
    }
    public var appId: String
    public var applicationVersion: String = Bundle.main.releaseVersionNumber ?? String()
    public var viewConfig: LaunchAlertViewConfig
}
