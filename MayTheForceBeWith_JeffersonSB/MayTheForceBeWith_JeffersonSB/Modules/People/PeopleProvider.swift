//
//  PeopleProvider.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 11/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import Foundation

public protocol ProviderPeople {
    func fechPeople() -> String
}

public final class PeopleProvider {
    public init() {}
}

extension PeopleProvider: ProviderPeople {
    public func fechPeople() -> String {
        return "Funcionou"
    }
}
