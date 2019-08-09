//
//  css.swift
//  TicTacToeDev
//
//  Created by Jack Wong on 8/1/19.
//  Copyright © 2019 Jack Wong. All rights reserved.
//
import UIKit
import Foundation

func btnCSS(_ buttons: [UIButton]){
    for button in buttons{
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 4.0
    }
}


