//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Usemobile on 22/04/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
