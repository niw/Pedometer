//
//  MainApp.swift
//  Pedometer
//
//  Created by Yoshimasa Niwa on 9/19/24.
//

import SwiftUI

@main
struct MainApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(Pedometer())
        }
    }
}
