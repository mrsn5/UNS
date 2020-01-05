//
//  OSLogConfig.swift
//  UNS
//
//  Created by San Byn Nguyen on 05.01.2020.
//  Copyright © 2020 San Byn Nguyen. All rights reserved.
//

import Foundation
import os.log

extension OSLog {
    private static var subsystem = Bundle.main.bundleIdentifier!

    static let viper = OSLog(subsystem: subsystem, category: "viper")
    static let service = OSLog(subsystem: subsystem, category: "service")
}
