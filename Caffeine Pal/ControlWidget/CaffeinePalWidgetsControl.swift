//
//  CaffeinePalWidgetsControl.swift
//  Caffeine Pal
//
//  Created by Navin Kumar R on 19/08/24.
//

import Foundation
import SwiftUI
import WidgetKit

@available(iOS 18.0, *)
struct CaffeinePalWidgetsControl: ControlWidget {
  static let kind: String = "com.superwall.caffeinePal.Caffeine-Pal.CaffeinePalWidgets"
  var body: some ControlWidgetConfiguration {
    StaticControlConfiguration(kind: Self.kind) {
      // Use our App Intent once again
      ControlWidgetButton(action: GetCaffeineIntent()) {
        Label("Caffeine Intake", systemImage: "cup.and.saucer.fill")
      }
    }
    .displayName("Get Caffeine Intake")
    .description("Shows how much caffeine you've had today.")
  }
}
