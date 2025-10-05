//
//  AlertActionable.swift
//  LaunchAlertKit
//
//  Created by Maziar Saadatfar on 10/5/25.
//
public protocol AlertActionable {
    func setAction(_ action: AlertAction)
}
public extension AlertActionable where Self: LaunchAlertViewModel {
    func setAction(_ action: AlertAction) {
        Task {
            let request = ActionRequest(appId: serviceConfig.appId, alertId: self.response.data?.id ?? "", action: action)
            let _ = try await actionService.action(request: request)
        }
    }
}
