import SwiftUI
import AirStrings

struct StatusView: View {
  @Environment(\.airStrings) private var strings

  var body: some View {
    NavigationStack {
      List {
        Section {
          HStack(spacing: 10) {
            Image(systemName: strings.isReady ? "checkmark.circle.fill" : "circle.dotted")
              .foregroundStyle(strings.isReady ? .green : .secondary)
              .imageScale(.large)
            VStack(alignment: .leading, spacing: 2) {
              Text(strings.isReady ? "Ready" : "Loading...")
                .font(.headline)
              Text("Locale: \(strings.currentLocale) \u{2022} Revision: \(strings.revision)")
                .font(.caption)
                .foregroundStyle(.secondary)
            }
          }
          .padding(.vertical, 4)
        }

        Section("Configuration") {
          row("Project", value: DemoConfig.projectId)
          row("Base URL", value: DemoConfig.baseURL.absoluteString)
        }

        Section {
          Button {
            Task { await strings.refresh() }
          } label: {
            Label("Refresh Now", systemImage: "arrow.clockwise")
          }
        }
      }
      .listStyle(.insetGrouped)
      .navigationTitle("Status")
      .navigationBarTitleDisplayMode(.inline)
    }
  }

  private func row(_ label: String, value: String) -> some View {
    VStack(alignment: .leading, spacing: 2) {
      Text(label)
        .font(.caption)
        .foregroundStyle(.secondary)
      Text(value)
        .font(.footnote)
        .fontDesign(.monospaced)
        .textSelection(.enabled)
    }
    .padding(.vertical, 2)
  }
}
