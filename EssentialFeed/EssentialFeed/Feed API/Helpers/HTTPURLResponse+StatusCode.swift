//
//  HTTPURLResponse+StatusCode.swift
//  EssentialFeed
//
//  Created by Usemobile on 06/05/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import Foundation

extension HTTPURLResponse {
   private static var OK_200: Int { return 200 }

   var isOK: Bool {
       return statusCode == HTTPURLResponse.OK_200
   }
}
