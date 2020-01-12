//
//  PeopleListCell.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 12/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import Foundation
import IGListKit

extension PeopleListCell {
    struct Appearance {
        let buttonSize = CGSize(width: 84, height: 24)
        let xxsSpace = 2
    }
}

class PeopleListCell: UICollectionViewCell {
    fileprivate let appearance = Appearance()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
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
        backgroundColor = .blackShark
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        contentView.addSubview(nameLabel)
    }

    private func makeConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview().inset(appearance.xxsSpace)
        }
    }
}

extension PeopleListCell: Configurable {
    final class ViewModel: ListDiffable {
        let url: String
        let name: String

        public static let empty = ViewModel(url: "", name: "")

        init(url: String, name: String) {
            self.url = url
            self.name = name
        }

        func diffIdentifier() -> NSObjectProtocol {
            return url as NSObjectProtocol
        }

        func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
            guard self !== object else { return true }
            guard let object = object as? PeopleListCell.ViewModel else { return false }
            return url == object.url
        }
    }

    func configure(with viewModel: PeopleListCell.ViewModel) {
        nameLabel.text = viewModel.name
    }
}

extension PeopleListCell: ListBindable {
    func bindViewModel(_ viewModel: Any) {
        guard let friendViewModel = viewModel as? PeopleListCell.ViewModel else {
            return
        }
        configure(with: friendViewModel)
    }
}
