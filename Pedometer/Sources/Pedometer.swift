//
//  Pedometer.swift
//  Pedometer
//
//  Created by Yoshimasa Niwa on 9/19/24.
//

import CoreMotion
import Foundation
import Observation

@MainActor
@Observable
final class Pedometer {
    private(set) var steps: Int = 0

    private let pedometer = CMPedometer()

    var isRunning: Bool = false {
        didSet {
            guard oldValue != isRunning else {
                return
            }
            if isRunning {
                pedometer.startUpdates(from: Date()) { [weak self] result, error in
                    guard let self, let result else {
                        return
                    }
                    self.steps = result.numberOfSteps.intValue
                }
            } else {
                pedometer.stopUpdates()
            }
        }
    }
}
