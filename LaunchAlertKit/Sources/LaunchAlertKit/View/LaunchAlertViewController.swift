//
//  LaunchAlertViewController.swift
//  
//
//  Created by Maziar Saadatfar on 10/21/23.
//

import UIKit

class LaunchAlertViewController: UIViewController {
    let viewModel: LaunchAlertViewModel
    let config: AlertServiceConfig

    init(viewModel: LaunchAlertViewModel, config: AlertServiceConfig) {
        self.viewModel = viewModel
        self.config = config
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let launchAlertView = LaunchAlertViewStyle.make(viewModel: viewModel,
                                                        config: config.viewConfig)
        view.addSubview(launchAlertView)
        launchAlertView.delegate = self
        launchAlertView.fixInView(view)
    }
}

extension LaunchAlertViewController: LaunchAlertDelegate {
    func dismiss() {
        self.dismiss(animated: true)
    }
}
