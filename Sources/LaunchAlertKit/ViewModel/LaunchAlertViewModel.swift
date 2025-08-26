//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 9/29/23.
//

import Foundation
import UIKit

public protocol LaunchAlertViewModel {
    var response: AlertResponse { get set }
    func openLink()
}

public final class DefaultLaunchAlertViewModel: LaunchAlertViewModel {
    public var response: AlertResponse
    public init(response: AlertResponse) {
        self.response = response
    }
    public func openLink() {
        if let url = response.data?.link, let urlFinal = URL(string: url) {
            UIApplication.shared.open(urlFinal)
        }
    }
}

