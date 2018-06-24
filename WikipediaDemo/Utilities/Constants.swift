//
//  ViewController.swift
//  WikipediaDemo

//  Created by Agarwal, JitendraKumar on 6/24/18.
//  Copyright © 2018 Agarwal, JitendraKumar. All rights reserved.
//


import Foundation
import UIKit
import Toast_Swift
// MARK: Storyboard
let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
// Color
func UIColorRGBA(_ r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor? {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}


// Screen Size
let SYSTEM_VERSION = UIDevice.current.systemVersion

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height
let MAIN_WINDOW = UIApplication.shared.windows.first

func IS_OF_4_INCH() -> Bool {
    switch UIDevice.current.modelName {
    case .iPhone5, .iPhone5S, .iPhone5C, .iPhoneSE:
        return true
    default:
        return false
    }
}

public func showToastWith (message: String) {
    
    // create a new style
    var style = ToastStyle()
    
    // customizing style of toast view
    style.messageColor = .white
  //  style.titleFont = DEFAULT_FONT().regular(14)
    
    // present the toast with the new style
     MAIN_WINDOW?.makeToast(message, duration: 3.0, position: .bottom, style: style)
    
    // toggle "tap to dismiss" functionality
    ToastManager.shared.isTapToDismissEnabled = true
    
    // dismiss current toast and all queued toasts
    //view.hideAllToasts()
    
    // toggle queueing behavior
    ToastManager.shared.isQueueEnabled = true
}
