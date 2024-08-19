//
//  EspressoTimelineProvide.swift
//  EspressoTimelineProvide
//
//  Created by Navin Kumar R on 19/08/24.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
  func placeholder(in context: Context) -> EspressoTimelineProvider {
    EspressoTimelineProvider(date: Date(), configuration: LogEspressoIntent())
  }
  
  func snapshot(for configuration: LogEspressoIntent, in context: Context) async -> EspressoTimelineProvider {
    EspressoTimelineProvider(date: Date(), configuration: configuration)
  }
  
  func timeline(for configuration: LogEspressoIntent, in context: Context) async -> Timeline<EspressoTimelineProvider> {
    var entries: [EspressoTimelineProvider] = []
    
    // Generate a timeline consisting of five entries an hour apart, starting from the current date.
    let currentDate = Date()
    for hourOffset in 0 ..< 5 {
      let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
      let entry = EspressoTimelineProvider(date: entryDate, configuration: configuration)
      entries.append(entry)
    }
    
    return Timeline(entries: entries, policy: .atEnd)
  }
  
  //    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
  //        // Generate a list containing the contexts this widget is relevant in.
  //    }
}

struct EspressoTimelineProvider: TimelineEntry {
  let date: Date
  let configuration: LogEspressoIntent
}

struct EspressoTimelineProvideEntryView : View {
  let store = CaffeineStore()
  var entry: EspressoTimelineProvider
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Today's Caffeine:")
        .font(.caption)
        .padding(.bottom, 4)
      Text(store.formattedAmount(.init(value: Double(entry.configuration.shots?.rawValue ?? 0),
                                       unit: .milligrams)))
      .font(.caption.weight(.semibold))
      .foregroundStyle(Color.secondary)
      Spacer()
      // Our intent being reused
      Button(intent: LogEspressoIntent(shots: .single)) {
        Text("Log a Shot")
          .frame(minWidth: 0, maxWidth: .infinity)
      }
    }
  }
}

struct EspressoTimelineProvide: Widget {
  let kind: String = "EspressoTimelineProvide"
  
  var body: some WidgetConfiguration {
    AppIntentConfiguration(kind: kind, intent: LogEspressoIntent.self, provider: Provider()) { entry in
      EspressoTimelineProvideEntryView(entry: entry)
        .containerBackground(.fill.tertiary, for: .widget)
    }
    .configurationDisplayName("My Widget")
    .description("This is an example widget.")
  }
}

extension LogEspressoIntent {
  fileprivate static var double: LogEspressoIntent {
    let intent = LogEspressoIntent()
    intent.shots = .double
    return intent
  }
  
  fileprivate static var triple: LogEspressoIntent {
    let intent = LogEspressoIntent()
    intent.shots = .triple
    return intent
  }
}

#Preview(as: .systemSmall) {
    EspressoTimelineProvide()
} timeline: {
  EspressoTimelineProvider(date: .now, configuration: .double)
  EspressoTimelineProvider(date: .now, configuration: .triple)
}
