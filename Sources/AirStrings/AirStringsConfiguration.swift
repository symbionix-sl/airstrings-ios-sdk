import Foundation

public struct AirStringsConfiguration: Sendable {
    public let organizationId: String
    public let projectId: String
    public let environmentId: String
    public let publicKeys: [String]
    public let locale: AirStringsLocale
    let baseURL: URL

    public init(
        organizationId: String,
        projectId: String,
        environmentId: String,
        publicKeys: [String],
        locale: AirStringsLocale = .system
    ) {
        self.organizationId = organizationId
        self.projectId = projectId
        self.environmentId = environmentId
        self.publicKeys = publicKeys
        self.locale = locale
        self.baseURL = URL(string: "https://cdn.airstrings.com")!
    }

    /// Internal initializer for testing and local development.
    init(
        organizationId: String,
        projectId: String,
        environmentId: String,
        publicKeys: [String],
        locale: AirStringsLocale = .system,
        baseURL: URL
    ) {
        self.organizationId = organizationId
        self.projectId = projectId
        self.environmentId = environmentId
        self.publicKeys = publicKeys
        self.locale = locale
        self.baseURL = baseURL
    }

    static let placeholder = AirStringsConfiguration(
        organizationId: "",
        projectId: "",
        environmentId: "",
        publicKeys: [],
        locale: .fixed("en"),
        baseURL: URL(string: "https://localhost")!
    )
}
