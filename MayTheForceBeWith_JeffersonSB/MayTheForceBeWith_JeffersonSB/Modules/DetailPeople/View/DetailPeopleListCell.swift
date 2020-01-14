//
//  DetailPeopleListCell.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 13/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import Foundation
import IGListKit

extension DetailPeopleListCell {
    struct Appearance {
        let buttonSize = CGSize(width: 84, height: 24)
        let xxsSpace = 2
        let xsSpace = 4
    }
}

class DetailPeopleListCell: UICollectionViewCell {
    fileprivate let appearance = Appearance()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textAlignment = .left
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17.0)
        label.textAlignment = .left
        return label
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
    }

    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(appearance.xxsSpace)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(appearance.xsSpace)
            make.leading.equalToSuperview().inset(appearance.xxsSpace)
        }
    }
}

extension DetailPeopleListCell: Configurable {
    final class ViewModel: ListDiffable {
        let title: String
        let subtitle: String

        public static let empty = ViewModel(title: "", subtitle: "")

        init(title: String, subtitle: String) {
            self.title = title
            self.subtitle = subtitle
        }

        func diffIdentifier() -> NSObjectProtocol {
            return title as NSObjectProtocol
        }

        func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
            guard self !== object else { return true }
            guard let object = object as? DetailPeopleListCell.ViewModel else { return false }
            return title == object.title
        }
    }

    func configure(with viewModel: DetailPeopleListCell.ViewModel) {
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
    }
}

extension DetailPeopleListCell: ListBindable {
    func bindViewModel(_ viewModel: Any) {
        guard let detailViewModel = viewModel as? DetailPeopleListCell.ViewModel else {
            return
        }
        configure(with: detailViewModel)
    }
}
