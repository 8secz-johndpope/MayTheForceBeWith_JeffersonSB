//
//  PeopleProvider.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 11/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import Foundation
import Moya

public typealias PeopleError = ((_ errorMessage: String) -> Void)
public typealias FetchPeopleSuccess = ((_ response: PeopleModel) -> Void)

public protocol PeopleProviderProtocol {
    func fechPeople(success: @escaping FetchPeopleSuccess, failure: @escaping PeopleError)
    func loadMore(page: Int, success: @escaping FetchPeopleSuccess, failure: @escaping PeopleError)
}

public final class PeopleProvider {
    let decoder: JSONDecoder
    let encoder: JSONEncoder
    let provider: MoyaProvider<PeopleAPIs>
    
    init(
        decoder: JSONDecoder = .init(),
        encoder: JSONEncoder = .init(),
        provider: MoyaProvider<PeopleAPIs> = MoyaProvider<PeopleAPIs>()
    ) {
        self.decoder = decoder
        self.encoder = encoder
        self.provider = provider
    }
}

extension PeopleProvider: PeopleProviderProtocol {
    public func fechPeople(success: @escaping FetchPeopleSuccess, failure: @escaping PeopleError) {
        provider.request(.all) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                guard let peopleModel = try? self.decoder.decode(PeopleModel.self, from: response.data) else {
                    return failure(response.statusCode.description)
                }
               success(peopleModel)
            case .failure(let error):
                failure(error.localizedDescription)
          }
        }
    }
    
    public func loadMore(page: Int, success: @escaping FetchPeopleSuccess, failure: @escaping PeopleError) {
        provider.request(.loadMore(page: page)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
               guard let peopleModel = try? self.decoder.decode(PeopleModel.self, from: response.data) else {
                  return failure(response.statusCode.description)
               }
               success(peopleModel)
            case .failure(let error):
               failure(error.localizedDescription)
            }
        }
    }
}
