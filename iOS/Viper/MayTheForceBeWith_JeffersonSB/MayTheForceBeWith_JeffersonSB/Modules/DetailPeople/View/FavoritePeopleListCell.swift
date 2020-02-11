//
//  FavoritePeopleListCell.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 14/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import Foundation
import IGListKit

extension FavoritePeopleListCell {
    struct Appearance {
        let buttonSize = CGSize(width: 30, height: 30)
        let xxsSpace = 8
        let xsSpace = 2
    }
}

class FavoritePeopleListCell: UICollectionViewCell {
    public var onClickAction: (() -> Void)?
    fileprivate let appearance = Appearance()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    lazy var favoriteIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "ic_unfavorite")
        return icon
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
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onClick)))
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        contentView.addSubview(favoriteIcon)
        contentView.addSubview(descriptionLabel)
    }

    private func makeConstraints() {
        favoriteIcon.snp.makeConstraints { make in
            make.size.equalTo(appearance.buttonSize)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(appearance.xxsSpace)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(favoriteIcon.snp.trailing).offset(appearance.xxsSpace)
            make.centerY.equalToSuperview()
        }
    }
    
    @objc
    func onClick() {
        onClickAction?()
    }
}

extension FavoritePeopleListCell: Configurable {
    final class ViewModel: ListDiffable {
        let isFavorite: Bool

        public static let empty = ViewModel(isFavorite: false)

        init(isFavorite: Bool) {
            self.isFavorite = isFavorite
        }

        func diffIdentifier() -> NSObjectProtocol {
            return isFavorite as NSObjectProtocol
        }

        func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
            guard self !== object else { return true }
            guard let object = object as? FavoritePeopleListCell.ViewModel else { return false }
            return isFavorite == object.isFavorite
        }
    }

    func configure(with viewModel: FavoritePeopleListCell.ViewModel) {
        let image = viewModel.isFavorite ? "ic_favorite" : "ic_unfavorite"
        favoriteIcon.image = UIImage(named: image)
        descriptionLabel.text = viewModel.isFavorite ? "Favorited" : "Click to favorite"
        descriptionLabel.accessibilityLabel = descriptionLabel.text
        accessibilityElements = [descriptionLabel]
    }
}

extension FavoritePeopleListCell: ListBindable {
    func bindViewModel(_ viewModel: Any) {
        guard let favoriteViewModel = viewModel as? FavoritePeopleListCell.ViewModel else {
            return
        }
        configure(with: favoriteViewModel)
    }
}

