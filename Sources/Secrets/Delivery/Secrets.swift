//
//  Secrets.swift
//  
//
//  Created by Martin Dutra on 24/11/21.
//

import Logger

public class Secrets {

    public enum Key {
        case posthog
        case bugsnag
        case push
    }
    
    public static let shared = Secrets()

    var service: SecretsService

    init(service: SecretsService = SecretsServiceAdapter(bundleSecretsService: PlistService())) {
        self.service = service
    }

    public func get(key: Secrets.Key) -> String? {
        let mapper = KeyMapper()
        if let key = mapper.map(key: key) {
            return service.get(key: key)
        } else {
            Logger.shared.fatal(.incorrectValue, "KeyMapper couldn't map a key")
            return nil
        }
    }

}
