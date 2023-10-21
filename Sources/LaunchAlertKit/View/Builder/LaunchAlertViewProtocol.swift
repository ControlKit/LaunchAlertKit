//
//  LaunchAlertViewProtocol.swift
//
//
//  Created by Maziar Saadatfar on 10/16/23.
//

import Foundation
import UIKit
public protocol LaunchAlertViewProtocol: UIView {
    var delegate: LaunchAlertDelegate? { get set }
}
