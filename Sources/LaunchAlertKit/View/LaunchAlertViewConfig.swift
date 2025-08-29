//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 10/18/23.
//

import Foundation
import UIKit
public class LaunchAlertViewConfig {
    public init(lang: String) {
        self.lang = lang
    }
    public let lang: String
    public var style: LaunchAlertViewStyle = .fullscreen1
    
    public var contentViewBackColor: UIColor = UIColor(r: 0, g: 0, b: 0, a: 0.8)
    public var contentBackGroundImage = UIImage()
    public var popupViewBackColor: UIColor = .black
    public var popupViewCornerRadius: CGFloat = 15.0
    
    public var imageType: ImageType = .alertIcon1
    public var image: String?
    public var imageColor: UIColor?
    
    public var titleFont = UIFont.systemFont(ofSize: 13, weight: .bold)
    public var title = "It's an alert"
    public var titleColor: UIColor = .orange
    
    public var descriptionFont = UIFont.systemFont(ofSize: 14, weight: .medium)
    public var descriptionText = "It's an alert description."
    public var descriptionTextColor: UIColor = .gray
    
    public var buttonFont = UIFont.systemFont(ofSize: 13, weight: .bold)
    public var buttonNormalTitle: String = "Ok"
    public var buttonBackColor: UIColor = .orange
    public var buttonTitleColor: UIColor = .white
    public var buttonCornerRadius: CGFloat = 20.0
    public var buttonBorderWidth: CGFloat = 0.0
    public var buttonBorderColor: UIColor = .clear
    
    public var closeButtonFont = UIFont.systemFont(ofSize: 11, weight: .medium)
    public var closeButtonNormalTitle: String = "Close"
    public var closeButtonBackColor: UIColor = .clear
    public var closeButtonTitleColor: UIColor = .orange
    public var closeButtonCornerRadius: CGFloat = 20.0
    public var closeButtonBorderWidth: CGFloat = 0.0
    public var closeButtonBorderColor: UIColor = .clear
    public var closeButtonImage: UIImage?
    public var closeButtonImageColor: UIColor = .orange
}

public enum ImageType: String {
    case alertIcon1 = "alert1"
    case alertIcon2 = "alert2"
    case alertIcon3 = "alert3"
    case gear = "gear"
}
