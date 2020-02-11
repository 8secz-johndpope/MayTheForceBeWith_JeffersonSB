//
//  PeopleAPIs.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 11/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import Moya

enum PeopleAPIs: TargetType {
    case all
    case loadMore(page: Int)

    var baseURL: URL {
        return AppService.shared.app.baseURL
    }

    var path: String {
        switch self {
        case .all:
            return "people/"
        case .loadMore:
            return "people/"
        }
    }

    var method: Moya.Method {
        switch self {
        case .all, .loadMore:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case let .loadMore(page):
            let queryParams = ["page": page]
            return .requestParameters(parameters: queryParams, encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return nil
    }
}
