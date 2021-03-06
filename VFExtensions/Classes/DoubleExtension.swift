//
//  DoubleExtension.swift
//  Ana Vodafone
//
//  Created by Taha on 7/9/18.
//  Copyright © 2018 Vodafone Egypt. All rights reserved.
//

import Foundation

extension Double {
    // remove decimal from a float if the decimal is equal to 0?
    var cleanValue: String {
        return String(format: "%g", self)
    }
}
