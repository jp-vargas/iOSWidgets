import WidgetKit
import SwiftUI

struct WidgetEntry: TimelineEntry {
    let date = Date()
    let entry: Array<Model>
}

struct Provider: TimelineProvider {
    let lastEntries = UserDefaults(suiteName: Connection.GROUP_NAME)!.object(forKey: "entries")
    
    var fakeEntry = [
        Model(
            title: "Bajo presión, EEUU comienza este viernes a procesar a los solicitantes de asilo varados en México",
            description: "Según lo anunciado, se espera que este viernes el gobierno de Estados Unidos comience la primera fase de procesamiento de los solicitantes de asilo varados en México bajo los Protocolos de Protección de Migrantes. Ocurre además en momentos en que las temperaturas están bajo el punto de congelación.",
            url: "https://st1.uvnimg.com/36/cb/c8d5e7ab453390cc4d25dd1cb54f/50ef2c06585343bc899147c9b25625cb",
            date: "12-12-2021"
        )
    ]
    
    func placeholder(in context: Context) -> WidgetEntry {
        WidgetEntry(entry: fakeEntry)
    }

    func getSnapshot(in context: Context, completion: @escaping (WidgetEntry) -> Void) {
        guard let entries = try? JSONDecoder().decode(Array<Model>.self, from: lastEntries as! Data) else { return }
        let localEntry = WidgetEntry(entry: entries)
        completion(localEntry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<WidgetEntry>) -> Void) {
        guard let entries = try? JSONDecoder().decode(Array<Model>.self, from: lastEntries as! Data) else { return }
        let localEntry = WidgetEntry(entry: entries)
        let timeline = Timeline(entries: [localEntry], policy: .never)
        completion(timeline)
    }
}

struct WidgetEntryView: View {
    let entries: Array<Model>

    @Environment(\.widgetFamily) var family
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            NoticiasWidgetSmall(noticia: entries[0])
        case .systemMedium:
            NoticiasWidgetMedium(entries: entries)
        default:
            NoticiasWidget(entries: entries)
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
            WidgetEntryView(entries: entry.entry)
        }
        .configurationDisplayName("Noticias")
        .description("Muestra las últimas noticias")
        .supportedFamilies([.systemMedium, .systemLarge, .systemSmall])
    }
}
