//
//  UIControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Usemobile on 22/04/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import UIKit

extension UIControl {
   func simulate(event: UIControl.Event) {
       allTargets.forEach { target in
           actions(forTarget: target, forControlEvent: event)?.forEach {
               (target as NSObject).perform(Selector($0))
           }
       }
   }
}
