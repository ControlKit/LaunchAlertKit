//
//  File.swift
//
//
//  Created by Maziar Saadatfar on 10/16/23.
//

import Foundation
import UIKit

public class LaunchAlertView_Popover1: UIView, LaunchAlertViewProtocol {
    var config: LaunchAlertViewConfig
    var viewModel: LaunchAlertViewModel
    weak public var delegate: LaunchAlertDelegate?
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = config.buttonBackColor
        button.titleLabel?.textColor = config.buttonTitleColor
        button.setTitle(config.buttonNortmalTitle, for: .normal)
        button.setTitle(config.buttonSelectedTitle, for: .selected)
        button.setCurvedView(cornerRadius: config.buttonCornerRadius,
                             borderWidth: config.buttonBorderWidth,
                             borderColor: config.buttonBorderColor)
        button.addTarget(self, action: #selector(openLink), for: .touchUpInside)
        button.titleLabel?.font = config.buttonFont
        button.setTitleColor(config.buttonTitleColor, for: .normal)
        return button
    }()
    
    lazy var closeButton: UIButton = {
        let closeButton = UIButton()
        let img = closeButtonIcon(color: config.closeButtonImageColor,
                                  image: config.closeButtonImage)
        closeButton.setImage(img, for: .normal)
        closeButton.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        closeButton.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        return closeButton
    }()
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = config.contentViewBackColor
        contentView.alpha = 0.8
        return contentView
    }()
    
    lazy var popupView: UIView = {
        let popupView = UIView()
        popupView.backgroundColor = config.popupViewBackColor
        popupView.setCurvedView(cornerRadius: config.popupViewCornerRadius)
        return popupView
    }()
    
    lazy var contentBackGroundImageView: UIImageView = {
        let contentBackGroundImageView = UIImageView()
        contentBackGroundImageView.image = config.contentBackGroundImage
        return contentBackGroundImageView
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        setIcon(color: config.imageColor,
                image: config.image,
                imageType: config.imageType,
                imageView: imageView)
        return imageView
    }()
    
    lazy var headerTitle: UILabel = {
        let headerTitle = UILabel()
        headerTitle.font = config.titleFont
        headerTitle.text = config.title
        headerTitle.textColor = config.titleColor
        headerTitle.textAlignment = .center
        headerTitle.numberOfLines = 0
        return headerTitle
    }()
    
    lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = config.descriptionFont
        descriptionLabel.text = config.descriptionText
        descriptionLabel.textColor = config.descriptionTextColor
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    public override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public required init(viewModel: LaunchAlertViewModel,
                         config: LaunchAlertViewConfig = Popover1LaunchAlertViewConfig()) {
        self.config = config
        self.viewModel = viewModel
        if let title = viewModel.response.title { self.config.title = title }
        if let buttonTitle = viewModel.response.buttonTitle { self.config.buttonNortmalTitle = buttonTitle }
        if let description = viewModel.response.description { self.config.descriptionText = description }
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup() {
        addSubview(contentView)
        contentView.fixInView(self)
        contentView.addSubview(contentBackGroundImageView)
        contentBackGroundImageView.fixInView(contentView)
        addSubview(popupView)
        popupView.addSubview(iconImageView)
        popupView.addSubview(headerTitle)
        popupView.addSubview(descriptionLabel)
        popupView.addSubview(button)
        popupView.addSubview(closeButton)
        setPopupViewConstraint()
        setUpdateImageViewConstraint()
        setTitleViewConstraint()
        setDescriptionConstraint()
        setCloseButtonConstraint()
        setButtonConstraint()
    }
    
    @objc
    func openLink() {
        viewModel.openLink()
        delegate?.dismiss()
    }
    
    @objc
    func dismiss() {
        delegate?.dismiss()
    }
    
    public func setPopupViewConstraint() {
        popupView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: popupView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: popupView,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerY,
            multiplier: 1,
            constant: 0).isActive = true
        popupView.leadingAnchor.constraint(
            equalTo: self.leadingAnchor,
            constant: 24).isActive = true
        NSLayoutConstraint(
            item: popupView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 433).isActive = true
    }
    
    public func setUpdateImageViewConstraint() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: iconImageView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: popupView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: iconImageView,
            attribute: .top,
            relatedBy: .equal,
            toItem: popupView,
            attribute: .top,
            multiplier: 1,
            constant: 66).isActive = true
        NSLayoutConstraint(
            item: iconImageView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: 64).isActive = true
        NSLayoutConstraint(
            item: iconImageView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 63).isActive = true
    }
    
    public func setTitleViewConstraint() {
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: headerTitle,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: popupView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: headerTitle,
            attribute: .top,
            relatedBy: .equal,
            toItem: iconImageView,
            attribute: .bottom,
            multiplier: 1,
            constant: 41).isActive = true
        
        headerTitle.leadingAnchor.constraint(
            equalTo: popupView.leadingAnchor,
            constant: 21).isActive = true
        
        NSLayoutConstraint(
            item: headerTitle,
            attribute: .height,
            relatedBy: .greaterThanOrEqual,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 30).isActive = true
    }
    
    public func setDescriptionConstraint() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: descriptionLabel,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: popupView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: descriptionLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: headerTitle,
            attribute: .bottom,
            multiplier: 1,
            constant: 10).isActive = true
        
        descriptionLabel.leadingAnchor.constraint(
            equalTo: popupView.leadingAnchor,
            constant: 21).isActive = true
        
        NSLayoutConstraint(
            item: descriptionLabel,
            attribute: .height,
            relatedBy: .greaterThanOrEqual,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 50).isActive = true
    }
    
    public func setCloseButtonConstraint() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: closeButton,
            attribute: .right,
            relatedBy: .equal,
            toItem: popupView,
            attribute: .right,
            multiplier: 1,
            constant: -8).isActive = true
        NSLayoutConstraint(
            item: closeButton,
            attribute: .top,
            relatedBy: .equal,
            toItem: popupView,
            attribute: .top,
            multiplier: 1,
            constant: 8).isActive = true
        NSLayoutConstraint(
            item: closeButton,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 40).isActive = true
        NSLayoutConstraint(
            item: closeButton,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 40).isActive = true
    }
    
    public func setButtonConstraint() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: button,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: popupView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: button,
            attribute: .top,
            relatedBy: .equal,
            toItem: descriptionLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 50).isActive = true
        NSLayoutConstraint(
            item: button,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: 222).isActive = true
        NSLayoutConstraint(
            item: button,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 56).isActive = true
    }
}

public class Popover1LaunchAlertViewConfig: LaunchAlertViewConfig {
    public override init() {
        super.init()
        style = .popover1
    }
}
