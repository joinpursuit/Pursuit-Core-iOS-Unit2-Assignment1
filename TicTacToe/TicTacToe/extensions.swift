//
//  extensions.swift
//  TicTacToe
//
//  Created by Howard Chang on 11/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

func attributes() {
    layer.cornerRadius = 5.0
    layer.masksToBounds = true
    layer.borderWidth = 4
    layer.borderColor = UIColor.black.cgColor
}
}
