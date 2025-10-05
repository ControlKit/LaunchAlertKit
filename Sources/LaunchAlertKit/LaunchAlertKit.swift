// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import UIKit
import Combine

public let launchAlertKit_Version: String = "1.0.0"
public class LaunchAlertKit: Alertable {
    public let alertService: AlertServiceProtocol!
    public init(alertService: AlertServiceProtocol = AlertService()) {
        self.alertService = alertService
    }
    @MainActor
    public func configure(root: UIViewController,
                          modalPresentationStyle: UIModalPresentationStyle = .fullScreen,
                          config: AlertServiceConfig) async {
        Task {
            let request = AlertRequest(appId: config.appId)
            guard let response = try await self.getAlert(request: request) else {
                return
            }
            let viewModel = DefaultLaunchAlertViewModel(serviceConfig: config, response: response)
            let vc = LaunchAlertViewController(
                viewModel: viewModel,
                config: config
            )
            vc.modalPresentationStyle = modalPresentationStyle
            if config.viewConfig.style == .popover1 ||
                config.viewConfig.style == .popover2 {
                vc.modalPresentationStyle = .overCurrentContext
            }
            DispatchQueue.main.async {
                root.present(vc, animated: true)
            }
        }
    }
}
