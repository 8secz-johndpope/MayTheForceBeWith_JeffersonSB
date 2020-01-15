//
//  ActivityIndicatorView.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 14/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import UIKit
import SnapKit

extension ActivityIndicatorView {
    struct Appearance {
        let buttonMargin = 25
    }
}

class ActivityIndicatorView: UIView {
    fileprivate let appearance = Appearance()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.isHidden = true
        activity.style = .whiteLarge
        return activity
    }()
    
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        backgroundColor = .blackShark
        addSubviews()
        makeConstraints()
    }

    func addSubviews() {
        addSubview(activityIndicator)
    }

    func makeConstraints() {
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(appearance.buttonMargin)
        }
    }
    
    public func startLoading() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }

    public func stopLoading() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
}
