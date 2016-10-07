//
//  ArtistItemView.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 07/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation
import BaseViewSwift

class ArtistItemView: BaseView {

    private let titleLabel = UILabel()

    var viewModel: ArtistViewModel? {

        didSet {

            titleLabel.text = viewModel?.title
        }
    }

    private struct Constants {

        struct Margin {

            static let left: CGFloat = 10.0
        }
    }


    // MARK: Setup

    override func setup() {

        super.setup()

        setupTitleLabel()
    }

    private func setupTitleLabel() {

        addSubview(titleLabel)
    }


    // MARK: - Constraints

    override func setupConstraints() {

        super.setupConstraints()

        setupTitleLabelConstraints()
    }

    private func setupTitleLabelConstraints() {

        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Margin.left).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
