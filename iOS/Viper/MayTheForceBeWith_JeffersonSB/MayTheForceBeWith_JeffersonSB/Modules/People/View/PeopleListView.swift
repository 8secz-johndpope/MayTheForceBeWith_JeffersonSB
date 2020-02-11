//
//  PeopleListView.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 12/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import UIKit
import SnapKit

extension PeopleListView {
    struct Appearance {
        let buttonMargin = 25
    }
}

class PeopleListView: UIView {
    public var showActivity: (() -> Void)?
    public var hideActivity: (() -> Void)?
    
    fileprivate let appearance = Appearance()
    
    lazy var activityIndicator = ActivityIndicatorView()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .blackShark
        collectionView.alwaysBounceVertical = true
        return collectionView
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
        addSubview(collectionView)
        addSubview(activityIndicator)
    }

    func makeConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(appearance.buttonMargin)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        var insets: UIEdgeInsets
        if #available(iOS 13.0, *) {
            insets = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: .zero)
        } else {
            insets = UIEdgeInsets(top: 70, left: 50, bottom: 0, right: .zero)
        }
        collectionView.contentInset = insets
        collectionView.scrollIndicatorInsets = insets
    }
}
