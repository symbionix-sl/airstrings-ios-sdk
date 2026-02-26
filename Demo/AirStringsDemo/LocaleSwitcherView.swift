import SwiftUI
import AirStrings

struct LocaleSwitcherView: View {
  @Environment(\.airStrings) private var strings
  @State private var selectedLocale = "en"

  var body: some View {
    Picker("Locale", selection: $selectedLocale) {
      ForEach(DemoConfig.availableLocales, id: \.self) { locale in
        Text(locale.uppercased())
          .font(.caption2)
          .tag(locale)
      }
    }
    .pickerStyle(.segmented)
    .frame(width: 160)
    .onChange(of: selectedLocale) { _, newLocale in
      Task {
        await strings.setLocale(newLocale)
      }
    }
  }
}
