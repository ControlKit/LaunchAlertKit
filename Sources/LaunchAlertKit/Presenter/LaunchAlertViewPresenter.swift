//
//  LaunchAlertPresenter.swift
//  LaunchAlertKit
//
//  Created by Maziar Saadatfar on 8/26/25.
//
import Foundation
import UIKit
public struct LaunchAlertViewPresenter {
    var config: LaunchAlertViewConfig
    public init(data: AlertModel?, config: LaunchAlertViewConfig) {
        self.config = config
        if let localTitle = data?.title,
            let title = getLocalizeString(localTitle) { self.config.title = title }
        
        if let localButtonTitle = data?.button_title,
           let buttonTitle = getLocalizeString(localButtonTitle) { self.config.buttonNormalTitle = buttonTitle }
        
        if let localCancelButtonTitle = data?.cancel_button_title,
           let cancelButtonTitle = getLocalizeString(localCancelButtonTitle) { self.config.closeButtonNormalTitle = cancelButtonTitle }
        
        if let localDescription = data?.description,
           let description = getLocalizeString(localDescription) { self.config.descriptionText = description }
        if let icon = data?.icon { self.config.image = icon } else { config.image = "gears" }
    }
    
    func getLocalizeString(_ localize: AlertLocalString) -> String? {
        guard let localizeString = localize.first(where: { $0.language == config.lang }) else {
            if let defaultLang = localize.first(where: { $0.language == "en" }) {
                return defaultLang.content
            } else {
                return nil
            }
        }
        return localizeString.content
    }
}
