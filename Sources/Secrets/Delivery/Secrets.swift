//
//  Secrets.swift
//  
//
//  Created by Martin Dutra on 24/11/21.
//

public class Secrets {

    public enum Key: String {
        case posthog
        case bugsnag
        case push
    }

    public static let shared = Secrets()

    var service: SecretsService

    init(service: SecretsService = PlistService()) {
        self.service = service
    }

    public func get(key: Key) -> String? {
        return service.get(key: key.rawValue)
    }

}
