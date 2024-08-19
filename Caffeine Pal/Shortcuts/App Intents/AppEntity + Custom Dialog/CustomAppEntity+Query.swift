//
//  CustomAppEntity+Query.swift
//  Caffeine Pal
//
//  Created by Navin Kumar R on 16/08/24.
//

import Foundation
import SwiftUI
import AppIntents

// AppEntity
struct BreakIncrementEntity: AppEntity {
  // 1
  static var typeDisplayRepresentation: TypeDisplayRepresentation = "Break Increment"
  
  // 2
  let id: Int
  
  let name: String
  
  // 3
  var displayRepresentation: DisplayRepresentation {
    DisplayRepresentation(
      title: LocalizedStringResource(
        stringLiteral: name
      )
    )
  }
  
  static var defaultQuery = LogBreakQuery()
  
  var breakIncrement: BreakIncrement {
    // Find the corresponding BreakIncrement by matching the id (minutes)
    return BreakIncrement.all.first { $0.minutes == id } ?? BreakIncrement.all.first!
  }
}


//Query
struct LogBreakQuery: EntityQuery {
  // 2
  func entities(for identifiers: [Int]) async throws -> [BreakIncrementEntity] {
    // 3
    let increments = allBreakIncrements()
      .filter { increment in
        return identifiers.contains(increment.id)
      }
    return increments
  }
}

struct BreakIncrement: Identifiable {
  let id = UUID()
  let minutes: Int
  let displayName: String
  let color: Color
  
  // Static array of all break increments
  static let all: [BreakIncrement] = [
    BreakIncrement(minutes: 15, displayName: "Thirty Minutes", color: .blue),
    BreakIncrement(minutes: 30, displayName: "Half Hour", color: .green),
    BreakIncrement(minutes: 60, displayName: "One Hour", color: .purple)
  ]
}

func allBreakIncrements() -> [BreakIncrementEntity] {
  let entities = BreakIncrement.all.map { increment in
    BreakIncrementEntity(
      id: increment.minutes,
      name: increment.displayName
    )
  }
  return entities
}

