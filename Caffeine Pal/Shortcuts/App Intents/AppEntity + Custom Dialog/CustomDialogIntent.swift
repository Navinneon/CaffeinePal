//
//  CustomDialogIntent.swift
//  Caffeine Pal
//
//  Created by Navin Kumar R on 16/08/24.
//

import Foundation
import AppIntents
import SwiftUI
// 1
struct LogBreakIntent: AppIntent, ProgressReportingIntent {
  // 2
  static let title: LocalizedStringResource = "Log a Break"

  @Parameter(title: "Break Increment")
  var breakIncrement: BreakIncrementEntity?
    
  // 3
  func perform() async throws -> some ProvidesDialog & ShowsSnippetView {
    let entity: BreakIncrementEntity

    // 1
    if let incrementEntity = self.breakIncrement {
      entity = incrementEntity
    } else {
      // 2
      let incrementEntity = try await $breakIncrement.requestDisambiguation(
        among: allBreakIncrements(),
        dialog: IntentDialog("Select a break length")
      )
      entity = incrementEntity
    }
      
    // 3
    let loggedView = BreakLoggedView(
      breakIncrement: entity.breakIncrement
    )
      
    // 4
    let logAmount = "\(entity.breakIncrement.minutes)"
    
    //Progress
    var step = Int64(10)
    progress.totalUnitCount = 100

    for _ in 1...10 {
      // Simulate a task delay
      try await Task.sleep(nanoseconds: 100_000_000_0)
      
      step += 10
      // Update progress
      progress.completedUnitCount = step
    }
    
    return .result(
      dialog: "Logged a \(logAmount) minute break",
      view: loggedView
    )
  }
}
