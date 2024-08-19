//
//  LogEspressoIntent.swift
//  Caffeine Pal
//
//  Created by Navin Kumar R on 15/08/24.
//

import Foundation
import AppIntents
import WidgetKit

// AppEnum Entity

struct LogEspressoIntent: AppIntent, WidgetConfigurationIntent {
  static var title = LocalizedStringResource("Log Espresso Shot")
  static var description = IntentDescription("Logs some espresso shots.")
  
  @Parameter(title: "Shots")
  var shots: EspressoShot?
  
  static var parameterSummary: some ParameterSummary {
    Summary("Logs \(\.$shots) of espresso shots")
  }
  
  init() {}

  init(shots: EspressoShot) {
    self.shots = shots
  }
  
  func perform() async throws -> some IntentResult & ProvidesDialog {
    // Check if shots are provided; if not, prompt the user
    if shots == nil {
      shots = try await $shots.requestValue(.init(stringLiteral: "How many shots of espresso are you drinking?"))
    }
    
    // Ensure shots are selected
    guard let shots = shots else {
      throw NSError(domain: "LogEspressoIntent", code: 0, userInfo: [NSLocalizedDescriptionKey: "No shots selected."])
    }
    
    // Perform the logging action
    let store = CaffeineStore()
    store.log(Double(shots.rawValue))
    
    // Refresh widgets
    WidgetCenter.shared.reloadAllTimelines()
    
    // Return result with a dialog message
    return .result(dialog: .init("Logged \(store.formattedAmount(.init(value: Double(shots.rawValue), unit: .milligrams)))."))
  }
}


enum EspressoShot: Int, CaseIterable, CustomStringConvertible {
  case single = 64, double = 128, triple = 192
  
  var description: String {
    switch self {
    case .single:
      "Single"
    case .double:
      "Double"
    case .triple:
      "Triple"
    }
  }
}

extension EspressoShot: AppEnum {
  static var typeDisplayRepresentation: TypeDisplayRepresentation = .init(name: "Shots")
  static var typeDisplayName: LocalizedStringResource = "Shots"
  static var caseDisplayRepresentations: [EspressoShot: DisplayRepresentation] = [
    .single: "Single",
    .double: "Double",
    .triple: "Triple"
  ]
}
