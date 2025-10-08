//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 9/29/23.
//

import Foundation
import UIKit
import ControlKitBase
public protocol LaunchAlertViewModel: AlertActionable {
    var response: AlertResponse { get set }
    var serviceConfig: AlertServiceConfig { get set }
    var actionService: GenericServiceProtocol { get set }
    func openLink()
}

public final class DefaultLaunchAlertViewModel: LaunchAlertViewModel {
    public var actionService: GenericServiceProtocol
    public var response: AlertResponse
    public var serviceConfig: AlertServiceConfig
    public init(
        serviceConfig: AlertServiceConfig,
        response: AlertResponse,
        actionService: GenericServiceProtocol = GenericService()
    ) {
        self.response = response
        self.actionService = actionService
        self.serviceConfig = serviceConfig
    }
    public func openLink() {
        if let url = response.data?.link, let urlFinal = URL(string: url) {
            UIApplication.shared.open(urlFinal)
        }
    }
    
    public func saveLatestResponseId(id: String) {
        UserDefaults.standard.set(id, forKey: latestLaunchAlertKey)
    }
}

