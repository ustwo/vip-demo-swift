//
//  AlbumItemView.swift
//  VIPDemo
//
//  Created by Daniela Dias on 10/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation
import BaseViewSwift


// MARK: - AlbumItemView

/// _AlbumItemView_ is a view responsible for the display of album details (title and image)
class AlbumItemView: BaseView {

    let imageView = UIImageView()
    let titleLabel = UILabel()

    var viewModel: AlbumViewModel? {

        didSet {

            titleLabel.text = viewModel?.title
            imageView.setImageURL(url: viewModel?.imageURL)
        }
    }

    private struct Constants {

        struct Margin {

            static let left: CGFloat = 10.0
            static let right: CGFloat = 10.0
        }

        struct ImageSize {

            static let width: CGFloat = 50.0
            static let height: CGFloat = 50.0
        }
    }


    // MARK: - Setup

    override func setup() {

        super.setup()

        setupImageView()
        setupTitleLabel()
    }

    private func setupImageView() {

        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
    }

    private func setupTitleLabel() {

        titleLabel.textColor = UIColor.darkGray
        addSubview(titleLabel)
    }


    // MARK: - Constraints

    override func setupConstraints() {

        super.setupConstraints()

        setupTitleLabelConstraints()
        setupImageViewConstraints()
    }

    private func setupImageViewConstraints() {

        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Margin.left).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: Constants.ImageSize.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Constants.ImageSize.height).isActive = true
    }

    private func setupTitleLabelConstraints() {

        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: Constants.Margin.left).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Margin.right).isActive = true
    }
}
