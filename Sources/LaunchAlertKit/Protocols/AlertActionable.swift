//
//  AlertActionable.swift
//  LaunchAlertKit
//
//  Created by Maziar Saadatfar on 10/5/25.
//
import ControlKitBase
public protocol AlertActionable {
    func setAction(_ action: ControlKitAction)
}
public extension AlertActionable where Self: LaunchAlertViewModel {
    func setAction(_ action: ControlKitAction) {
        Task {
            var request = ActionRequest(
                route: .launch_alert,
                appId: serviceConfig.appId,
                sdkVersion: launchAlertKit_Version,
                action: action,
                itemId: self.response.data?.id ?? "",
            )
            request.extraParameter = "\(request.itemId ?? "")"
            let _: Result<ActionResponse> = try await actionService.execute(request: request)
        }
    }
}
