//
//  EspressoTimelineProvideLiveActivity.swift
//  EspressoTimelineProvide
//
//  Created by Navin Kumar R on 19/08/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct EspressoTimelineProvideAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct EspressoTimelineProvideLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: EspressoTimelineProvideAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension EspressoTimelineProvideAttributes {
    fileprivate static var preview: EspressoTimelineProvideAttributes {
        EspressoTimelineProvideAttributes(name: "World")
    }
}

extension EspressoTimelineProvideAttributes.ContentState {
    fileprivate static var smiley: EspressoTimelineProvideAttributes.ContentState {
        EspressoTimelineProvideAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: EspressoTimelineProvideAttributes.ContentState {
         EspressoTimelineProvideAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: EspressoTimelineProvideAttributes.preview) {
   EspressoTimelineProvideLiveActivity()
} contentStates: {
    EspressoTimelineProvideAttributes.ContentState.smiley
    EspressoTimelineProvideAttributes.ContentState.starEyes
}
