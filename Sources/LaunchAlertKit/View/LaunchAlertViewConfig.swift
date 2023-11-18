//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 10/18/23.
//

import Foundation
import UIKit
public class LaunchAlertViewConfig {
    public init() {}
    public var style: LaunchAlertViewStyle = .fullscreen1
    
    public var contentViewBackColor: UIColor = UIColor(r: 0, g: 0, b: 0, a: 0.8)
    public var contentBackGroundImage = UIImage()
    public var popupViewBackColor: UIColor = .black
    public var popupViewCornerRadius: CGFloat = 15.0
    
    public var imageType: ImageType = .alerticon1
    public var image: String?
    public var imageColor: UIColor?
    
    public var titleFont = UIFont.systemFont(ofSize: 13, weight: .bold)
    public var title = "It's time to update"
    public var titleColor: UIColor = .orange
    
    public var descriptionFont = UIFont.systemFont(ofSize: 14, weight: .medium)
    public var descriptionText = "It's time to update The version you are using is old, need to update the latest version in order to experience new features."
    public var descriptionTextColor: UIColor = .gray
    
    public var buttonFont = UIFont.systemFont(ofSize: 13, weight: .bold)
    public var buttonNortmalTitle: String = "I understood"
    public var buttonSelectedTitle: String = "I understood"
    public var buttonBackColor: UIColor = .orange
    public var buttonTitleColor: UIColor = .white
    public var buttonCornerRadius: CGFloat = 20.0
    public var buttonBorderWidth: CGFloat = 0.0
    public var buttonBorderColor: UIColor = .clear
    
    public var closeButtonFont = UIFont.systemFont(ofSize: 11, weight: .medium)
    public var closeBottonNortmalTitle: String = "Close"
    public var closeButtonBackColor: UIColor = .clear
    public var closeButtonTitleColor: UIColor = .orange
    public var closeButtonCornerRadius: CGFloat = 20.0
    public var closeButtonBorderWidth: CGFloat = 0.0
    public var closeButtonBorderColor: UIColor = .clear
}

public enum ImageType: String {
    case alerticon1 = "alert1"
    case alerticon2 = "alert2"
    case alerticon3 = "alert3"
    case gear = "gear"
}
