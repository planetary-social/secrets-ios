//
//  PlistService.swift
//  
//
//  Created by Martin Dutra on 24/11/21.
//

import Foundation

class PlistService: SecretsService {

    var dictionary: NSDictionary?

    init() {
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist") {
            dictionary = NSDictionary(contentsOfFile: path)
        }
    }

    func get(key: String) -> String? {
        return dictionary?[key] as? String
    }

}
