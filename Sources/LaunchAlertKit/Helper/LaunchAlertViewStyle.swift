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
    case popover5
    case popover1
    case popover2
    case popover3
    case popover4
    public static func make(viewModel: LaunchAlertViewModel,
                            config: LaunchAlertViewConfig) -> LaunchAlertViewProtocol {
        switch config.style {
        case .fullscreen1:
            return LaunchAlertView_FullScreen1(viewModel: viewModel,
                                               config: config)
        case .popover1:
            return LaunchAlertView_Popover1(viewModel: viewModel,
                                            config: config)
        case .popover2:
            return LaunchAlertView_Popover2(viewModel: viewModel,
                                            config: config)
        case .popover3:
            return LaunchAlertView_Popover3(viewModel: viewModel,
                                               config: config)
        case .popover4:
            return LaunchAlertView_Popover4(viewModel: viewModel,
                                               config: config)
        case .popover5:
            return LaunchAlertView_Popover5(viewModel: viewModel,
                                               config: config)
        }
    }
    
    public static func getViewConfigWithStyle(style: LaunchAlertViewStyle, lang: CKLanguage) -> LaunchAlertViewConfig {
        switch style {
        case .fullscreen1:
            FullScreen1LaunchAlertViewConfig(lang: lang)
        case .popover1:
            Popover1LaunchAlertViewConfig(lang: lang)
        case .popover2:
            Popover2LaunchAlertViewConfig(lang: lang)
        case .popover3:
            Popover3LaunchAlertViewConfig(lang: lang)
        case .popover4:
            Popover4LaunchAlertViewConfig(lang: lang)
        case .popover5:
            Popover5LaunchAlertViewConfig(lang: lang)
        }
    }
}
