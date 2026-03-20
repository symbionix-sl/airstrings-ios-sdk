import Foundation

public struct AirStringsConfiguration: Sendable {
    public let projectId: String
    public let publicKeys: [String]
    public let locale: AirStringsLocale
    let baseURL: URL

    public init(
        projectId: String,
        publicKeys: [String],
        locale: AirStringsLocale = .system
    ) {
        self.projectId = projectId
        self.publicKeys = publicKeys
        self.locale = locale
        self.baseURL = URL(string: "https://cdn.airstrings.com")!
    }

    /// Internal initializer for testing and local development.
    init(
        projectId: String,
        publicKeys: [String],
        locale: AirStringsLocale = .system,
        baseURL: URL
    ) {
        self.projectId = projectId
        self.publicKeys = publicKeys
        self.locale = locale
        self.baseURL = baseURL
    }

    static let placeholder = AirStringsConfiguration(
        projectId: "",
        publicKeys: [],
        locale: .fixed("en"),
        baseURL: URL(string: "https://localhost")!
    )
}
