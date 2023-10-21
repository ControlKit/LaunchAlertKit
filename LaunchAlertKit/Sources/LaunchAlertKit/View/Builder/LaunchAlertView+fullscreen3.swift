//
//  File.swift
//
//
//  Created by Maziar Saadatfar on 10/16/23.
//

import Foundation
import UIKit

public class LaunchAlertView_FullScreen3: UIView, LaunchAlertViewProtocol {
    var config: LaunchAlertViewConfig
    var viewModel: LaunchAlertViewModel
    weak var delegate: LaunchAlertDelegate?
    lazy var updateButton: UIButton = {
        let updateButton = UIButton()
        updateButton.backgroundColor = config.updateButtonBackColor
        updateButton.titleLabel?.textColor = config.updateButtonTitleColor
        updateButton.setTitle(config.updateButtonNortmalTitle, for: .normal)
        updateButton.setTitle(config.updateButtonSelectedTitle, for: .selected)
        updateButton.setImage(config.updateButtonImage, for: .selected)
        updateButton.setCurvedView(cornerRadius: config.updateButtonCornerRadius,
                                   borderWidth: config.updateButtonBorderWidth,
                                   borderColor: config.updateButtonBorderColor)
        updateButton.addTarget(self, action: #selector(openLink), for: .touchUpInside)
        updateButton.titleLabel?.font = config.updateButtonFont
        updateButton.setTitleColor(config.updateButtonTitleColor, for: .normal)
        return updateButton
    }()
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = config.contentViewBackColor
        return contentView
    }()
    
    lazy var contentBackGroundImageView: UIImageView = {
        let contentBackGroundImageView = UIImageView()
        contentBackGroundImageView.image = config.contentBackGroundImage
        return contentBackGroundImageView
    }()
    
    lazy var updateImageView: UIImageView = {
        let updateImageView = UIImageView()
        if let color = config.updateImageColor {
            if let img = config.updateImage?.imageWithColor(color: color) {
                updateImageView.image = img
            } else {
                let img = ImageHelper.image(config.updateImageType.rawValue)?.imageWithColor(color: color)
                updateImageView.image = img
            }
        } else {
            if let img = config.updateImage {
                updateImageView.image = img
            } else {
                let img = ImageHelper.image(config.updateImageType.rawValue)
                updateImageView.image = img
            }
        }
        return updateImageView
    }()
      
    lazy var headerTitle: UILabel = {
        let headerTitle = UILabel()
        headerTitle.font = config.headerTitleFont
        headerTitle.text = config.headerTitle
        headerTitle.textColor = config.headerTitleColor
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
    
    lazy var versionLabel: UILabel = {
        let versionLabel = UILabel()
        versionLabel.font = config.versionFont
        versionLabel.text = config.versionText
        versionLabel.textColor = config.versionTextColor
        versionLabel.textAlignment = .center
        versionLabel.numberOfLines = 0
        return versionLabel
    }()
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        contentView.setCurvedView(cornerRadius: 20)
    }
    
    public required init(viewModel: LaunchAlertViewModel,
                         config: LaunchAlertViewConfig = LaunchAlertViewConfig()) {
        self.config = config
        self.viewModel = viewModel
        if let title = viewModel.response.title { self.config.headerTitle = title }
        if let buttonTitle = viewModel.response.buttonTitle { self.config.updateButtonNortmalTitle = buttonTitle }
        if let version = viewModel.response.version { self.config.versionText = version }
        if let description = viewModel.response.description { self.config.descriptionText = description }
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func commonInit() {
        contentView.fixInView(self)
    }
    
    public func setup() {
        addSubview(contentView)
        contentView.fixInView(self)
        contentView.addSubview(contentBackGroundImageView)
        contentBackGroundImageView.fixInView(contentView)
        contentView.addSubview(updateImageView)
        contentView.addSubview(headerTitle)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(updateButton)
        contentView.addSubview(versionLabel)
        commonInit()
        setUpdateImageViewConstraint()
        setTitleViewConstraint()
        setDescriptionConstraint()
        setButtonConstraint()
        setVersionConstraint()
    }
    
    @objc
    func openLink() {
        viewModel.openLink()
        delegate?.dismiss()
    }
    
    public func setUpdateImageViewConstraint() {
        updateImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: updateImageView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: updateImageView,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .centerY,
            multiplier: 1,
            constant: -150).isActive = true
        NSLayoutConstraint(
            item: updateImageView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: 191).isActive = true
        NSLayoutConstraint(
            item: updateImageView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 139).isActive = true
    }
    
    public func setTitleViewConstraint() {
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: headerTitle,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: headerTitle,
            attribute: .top,
            relatedBy: .equal,
            toItem: updateImageView,
            attribute: .bottom,
            multiplier: 1,
            constant: 31).isActive = true
        
        headerTitle.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        
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
            toItem: contentView,
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
            constant: 16).isActive = true
        
        descriptionLabel.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        
        NSLayoutConstraint(
            item: descriptionLabel,
            attribute: .height,
            relatedBy: .greaterThanOrEqual,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 50).isActive = true
    }
    
    public func setButtonConstraint() {
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: updateButton,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: updateButton,
            attribute: .top,
            relatedBy: .equal,
            toItem: descriptionLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 42).isActive = true
        NSLayoutConstraint(
            item: updateButton,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: 222).isActive = true
        NSLayoutConstraint(
            item: updateButton,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 56).isActive = true
    }
    
    public func setVersionConstraint() {
        versionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: versionLabel,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: versionLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: updateButton,
            attribute: .bottom,
            multiplier: 1,
            constant: 16).isActive = true
        versionLabel.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        NSLayoutConstraint(
            item: versionLabel,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 20).isActive = true
    }
}
