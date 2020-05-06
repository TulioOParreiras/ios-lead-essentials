//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Usemobile on 06/05/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import UIKit

extension UIRefreshControl {
   func update(isRefreshing: Bool) {
       isRefreshing ? beginRefreshing() : endRefreshing()
   }
}
