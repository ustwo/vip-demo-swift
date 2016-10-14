//
//  AlbumTableViewCell.swift
//  VIPDemo
//
//  Created by Daniela Dias on 10/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


// MARK: -  AlbumTableViewCell

/// _AlbumTableViewCell_ is the table view cell responsible to display an album
final class AlbumTableViewCell: BaseTableViewCell {

    let itemView = AlbumItemView()

    var viewModel: AlbumViewModel? {

        didSet {

            itemView.viewModel = viewModel
        }
    }


    // MARK: - Setup

    override func setup() {

        super.setup()

        clipsToBounds = true
        selectionStyle = .none

        setupItemView()
    }

    private func setupItemView() {

        contentView.addSubview(itemView)
    }


    // MARK: - Constraints

    override func setupConstraints() {

        super.setupConstraints()

        setupItemViewConstraints()
    }

    private func setupItemViewConstraints() {

        itemView.translatesAutoresizingMaskIntoConstraints = false

        itemView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        itemView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        itemView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        itemView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }


    // MARK: - Reuse

    override func prepareForReuse() {

        super.prepareForReuse()

        viewModel = nil
    }
}
