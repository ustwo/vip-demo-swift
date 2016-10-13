//
//  ArtistTableViewCell.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 07/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: -  ArtistTableViewCell

/// _ArtistTableViewCell_ is the table view cell responsible to display an artist
final class ArtistTableViewCell: BaseTableViewCell {

    let itemView = ArtistItemView()

    var viewModel: ArtistViewModel? {

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
