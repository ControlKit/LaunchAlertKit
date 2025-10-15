//
//  AlertServiceConfig.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
import ControlKitBase
public struct AlertServiceConfig {
    public init(style: LaunchAlertViewStyle = .fullscreen1,
                appId: String,
                language: CKLanguage) {
        self.viewConfig = LaunchAlertViewStyle.getViewConfigWithStyle(style: style, lang: language)
        self.appId = appId
        self.language = language
    }
    public var appId: String
    public var language: CKLanguage
    public var viewConfig: LaunchAlertViewConfig
}
