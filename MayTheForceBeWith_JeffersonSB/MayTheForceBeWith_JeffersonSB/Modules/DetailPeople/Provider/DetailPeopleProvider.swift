//
//  DetailPeopleProvider.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 14/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import Foundation
import Moya

public typealias FavoriteError = ((_ errorMessage: String) -> Void)
public typealias FavoriteSuccess = ((_ response: Bool) -> Void)

public protocol DetailPeopleProviderProtocol {
    func favoritePeople(success: @escaping FavoriteSuccess, failure: @escaping FavoriteError)
}

public final class DetailPeopleProvider {
    let decoder: JSONDecoder
    let encoder: JSONEncoder
    let provider: MoyaProvider<DetailPeopleAPIs>
    
    init(
        decoder: JSONDecoder = .init(),
        encoder: JSONEncoder = .init(),
        provider: MoyaProvider<DetailPeopleAPIs> = MoyaProvider<DetailPeopleAPIs>()
    ) {
        self.decoder = decoder
        self.encoder = encoder
        self.provider = provider
    }
}

extension DetailPeopleProvider: DetailPeopleProviderProtocol {
    public func favoritePeople(success: @escaping FavoriteSuccess, failure: @escaping FavoriteError) {
        provider.request(.post(id: 1)) { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let response):
                if let json = String(data: response.data, encoding: String.Encoding.utf8) {
                    debugPrint("POST-RESULT: \(String(describing: json))")
                }
                success(true)
            case .failure(let error):
                failure(error.localizedDescription)
          }
        }
    }
}
