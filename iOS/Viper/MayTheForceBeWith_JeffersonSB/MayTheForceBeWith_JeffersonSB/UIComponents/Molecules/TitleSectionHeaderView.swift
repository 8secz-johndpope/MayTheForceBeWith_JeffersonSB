//
//  TitleSectionHeaderView.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 12/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import UIKit

extension TitleSectionHeaderView {
    struct Appearance {
        let xsSpace = 12
        let xxsSpace = 2
    }
}

public class TitleSectionHeaderView: UICollectionReusableView {
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private let appearance: Appearance = .init()

    public override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(frame: .zero)
        commonInit()
    }

    private func commonInit() {
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        addSubview(titleLabel)
    }

    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(appearance.xxsSpace)
            make.bottom.equalToSuperview().inset(appearance.xsSpace)
        }
    }
}

extension TitleSectionHeaderView: Configurable {
    public struct ViewModel {
        public let title: String
        public init(title: String) {
            self.title = title
        }
    }

    public func configure(with viewModel: TitleSectionHeaderView.ViewModel) {
        titleLabel.text = viewModel.title
    }
}

