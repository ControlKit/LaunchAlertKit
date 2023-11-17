//
//  LaunchAlertViewStyle.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
import UIKit

public enum LaunchAlertViewStyle {
    case fullscreen1
    case fullscreen2
    case fullscreen3
    case fullscreen4
    case popover1
    case popover2
    public static func make(viewModel: LaunchAlertViewModel,
                            config: LaunchAlertViewConfig) -> LaunchAlertViewProtocol {
        switch config.style {
        case .fullscreen1:
            return LaunchAlertView_FullScreen1(viewModel: viewModel,
                                               config: config)
        case .fullscreen2:
            return LaunchAlertView_FullScreen2(viewModel: viewModel,
                                               config: config)
        case .fullscreen3:
            return LaunchAlertView_FullScreen3(viewModel: viewModel,
                                               config: config)
        case .fullscreen4:
            return LaunchAlertView_FullScreen4(viewModel: viewModel,
                                               config: config)
        case .popover1:
            return LaunchAlertView_Popover1(viewModel: viewModel,
                                            config: config)
        case .popover2:
            return LaunchAlertView_Popover2(viewModel: viewModel,
                                            config: config)
        }
    }
    
    public static func getViewConfigWithStyle(style: LaunchAlertViewStyle) -> LaunchAlertViewConfig {
        switch style {
        case .fullscreen1:
            FullScreen1LaunchAlertViewConfig()
        case .fullscreen2:
            FullScreen2LaunchAlertViewConfig()
        case .fullscreen3:
            FullScreen3LaunchAlertViewConfig()
        case .fullscreen4:
            FullScreen4LaunchAlertViewConfig()
        case .popover1:
            Popover1LaunchAlertViewConfig()
        case .popover2:
            Popover2LaunchAlertViewConfig()
        }
    }
}
