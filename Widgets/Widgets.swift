import WidgetKit
import SwiftUI

struct WidgetEntry: TimelineEntry {
    let date = Date()
//    let entry: Model?
}

struct Provider: TimelineProvider {
//    @AppStorage("noticias", store: UserDefaults(suiteName: "group.com.lap.Univision"))
//    var lastEntriesData: Data = Data()
    
    func placeholder(in context: Context) -> WidgetEntry {
        WidgetEntry()
    }

    func getSnapshot(in context: Context, completion: @escaping (WidgetEntry) -> Void) {
//        guard let entry = try? JSONDecoder().decode(Model.self, from: lastEntriesData) else { return }
        let localEntry = WidgetEntry()
        completion(localEntry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<WidgetEntry>) -> Void) {
//        guard let entry = try? JSONDecoder().decode(Model.self, from: lastEntriesData) else { return }
        let localEntry = WidgetEntry()
        let timeline = Timeline(entries: [localEntry], policy: .never)
        completion(timeline)
    }
}

struct WidgetEntryView: View {
    let entry: Provider.Entry

    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            NoticiasWidget()
            
        case .systemMedium:
            NoticiasWidget()
        
        default:
            NoticiasWidget()
        }
    }
}

@main
struct WidgetUI: Widget {
    private let kind = "Widget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: Provider()
        ) { entry in
            NoticiasWidget()
        }
        .configurationDisplayName("Noticias")
        .description("Muestra las últimas noticias")
        .supportedFamilies([.systemLarge, .systemMedium, .systemSmall])
    }
}
