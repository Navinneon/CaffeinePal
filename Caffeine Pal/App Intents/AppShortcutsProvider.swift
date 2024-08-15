//
//  AppShortcutsProvider.swift
//  Caffeine Pal
//
//  Created by Navin Kumar R on 15/08/24.
//

import Foundation
import AppIntents

struct ShortcutsProvider: AppShortcutsProvider {
  static var appShortcuts: [AppShortcut] {
    AppShortcut(intent: GetCaffeineIntent(),
                phrases: ["Get caffeine in \(.applicationName)",
                          "See caffeine in \(.applicationName)",
                          "Show me much caffeine I've had in \(.applicationName)",
                          "Show my caffeine intake in \(.applicationName)"],
                shortTitle: "Get Caffeine Intake",
                systemImageName: "cup.and.saucer.fill")
  }
}
