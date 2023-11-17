// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import UIKit
import Combine

public class LaunchAlertKit: Alertable {
    public let alertService: AlertServiceProtocol!
    public init(alertService: AlertServiceProtocol = AlertService()) {
        self.alertService = alertService
    }
    
    public func configure(root: UIViewController,
                          modalPresentationStyle: UIModalPresentationStyle = .fullScreen,
                          config: AlertServiceConfig = AlertServiceConfig()) async {
        Task {
            let request = AlertRequest(appId: config.appId,
                                       version: config.version,
                                       route: config.route,
                                       language: config.language)
            let response = try await self.getAlert(request: request)
            let viewModel = DefaultLaunchAlertViewModel(response: response)
            DispatchQueue.main.async {
                let vc = LaunchAlertViewController(viewModel: viewModel,
                                                   config: config)
                vc.modalPresentationStyle = modalPresentationStyle
                if config.viewConfig.style == .popover1 || config.viewConfig.style == .popover2 {
                    vc.modalPresentationStyle = .overCurrentContext
                }
                root.present(vc, animated: true)
            }
        }
    }
}
