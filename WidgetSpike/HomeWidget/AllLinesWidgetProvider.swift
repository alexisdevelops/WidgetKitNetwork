//
//  HomeWidget.swift
//  HomeWidget
//
//  Created by alexis on 17/03/21.
//

import Foundation
import Shared
import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), line: nil, updates: Line.allCases.map { line in
            LineStatusUpdate(line: line)
        })
    }

    public func getSnapshot(in context: Context,
                            completion: @escaping (SimpleEntry) -> ()) {
        StatusService.getStatus(client: NetworkClient()) { updates in
            completion(placeholder(in: context))
        }
    }

    public func getTimeline(in context: Context,
                            completion: @escaping (Timeline<Entry>) -> ()) {
        print("\(Date()) - Refreshing status")
        StatusService.getStatus(client: NetworkClient()) { updates in
            let entry = SimpleEntry(date: Date(), line: nil, updates: updates)
            // Refresh the data every two minutes:
            let expiryDate = Calendar.current.date(byAdding: .minute, value: 5, to: Date()) ?? Date()
            let timeline = Timeline(entries: [entry], policy: .after(expiryDate))
            completion(timeline)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let line: Line?
    let updates: [LineStatusUpdate]
}

//struct HomeWidgetEntryView : View {
//    var entry: Provider.Entry
//
//    var body: some View {
//        Text(entry.date, style: .time)
//    }
//}

//@main
//struct HomeWidget: Widget {
//    let kind: String = "HomeWidget"
//
//    var body: some WidgetConfiguration {
//        StaticConfiguration(kind: kind, provider: Provider()) { entry in
//            HomeWidgetEntryView(entry: entry)
//        }
//        .configurationDisplayName("My Widget")
//        .description("This is an example widget.")
//    }
//}

struct AllLinesWidget: Widget {
    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: "All Lines",
                            provider: Provider()) { entry in
            StaticContentView(updates: entry.updates)
        }
        .configurationDisplayName("Tube Status")
        .description("See the status board for all London Underground lines")
        .supportedFamilies([.systemLarge])
    }
}

//struct HomeWidget_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeWidgetEntryView(entry: SimpleEntry(date: Date()))
//            .previewContext(WidgetPreviewContext(family: .systemSmall))
//    }
//}
