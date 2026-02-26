import SwiftUI
import AirStrings

struct StringListView: View {
  @Environment(\.airStrings) private var strings

  private let demoKeys = [
    "greeting",
    "farewell",
    "app.title",
    "settings.theme",
    "settings.language",
    "onboarding.welcome",
  ]

  var body: some View {
    NavigationStack {
      List {
        ForEach(demoKeys, id: \.self) { key in
          let value = strings[key]
          let isFallback = value == key

          HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 2) {
              Text(key)
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
              Text(value)
                .font(.body)
                .foregroundStyle(isFallback ? .secondary : .primary)
                .italic(isFallback)
            }
            Spacer()
            if isFallback {
              Image(systemName: "exclamationmark.triangle")
                .font(.caption)
                .foregroundStyle(.orange)
            }
          }
          .padding(.vertical, 2)
        }
      }
      .listStyle(.insetGrouped)
      .navigationTitle("Strings")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .principal) {
          LocaleSwitcherView()
        }
      }
      .refreshable {
        await strings.refresh()
      }
    }
  }
}
