//
//  MainView.swift
//  Pedometer
//
//  Created by Yoshimasa Niwa on 9/19/24.
//

import SwiftUI

struct MainView: View {
    @Environment(Pedometer.self)
    var pedometer

    var body: some View {
        Form {
            LabeledContent {
                Text("\(pedometer.steps)")
            } label: {
                Label {
                    Text("Steps")
                } icon: {
                    Image(systemName: "figure.walk")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                }
            }

            Section {
                let bindable = Bindable(pedometer)
                Toggle(isOn: bindable.isRunning) {
                    Text("Enabled")
                }
            }
        }
    }
}

#Preview {
    MainView()
        .environment(Pedometer())
}
