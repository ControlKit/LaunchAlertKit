//
//  AlertServiceConfig.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
public struct AlertServiceConfig {
    public init() {}
    public var route: String = "https://my.api.mockaroo.com/forceAlert.json?key=2202ab40"
    public var appId: String = Bundle.main.bundleIdentifier ?? String()
    public var version: String = Bundle.main.releaseVersionNumber ?? String()
    public var viewConfig: LaunchAlertViewConfig = LaunchAlertViewConfig()
}
