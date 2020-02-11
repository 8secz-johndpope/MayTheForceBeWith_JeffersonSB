//
//  DetailPeopleAPIs.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 14/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import Moya

enum DetailPeopleAPIs: TargetType {
    case post(id: Int)

    var baseURL: URL {
        return AppService.shared.app.basePost
    }

    var path: String {
        switch self {
        case let .post(id):
            return "/\(id)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .post:
            return .post
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String: String]? {
        return nil
    }
}
