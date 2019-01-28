//
//  FloatExtensions.swift
//  Ana Vodafone
//
//  Created by Taha on 7/4/18.
//  Copyright © 2018 Vodafone Egypt. All rights reserved.
//

import Foundation

extension Float {
    // remove decimal from a float if the decimal is equal to 0?
    var cleanValue: String {
        return String(format: "%g", self)
    }
}
