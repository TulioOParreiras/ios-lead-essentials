//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Usemobile on 13/06/20.
//  Copyright © 2020 Essential Developer. All rights reserved.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
