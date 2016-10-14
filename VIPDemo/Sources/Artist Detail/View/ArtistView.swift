//
//  ArtistView.swift
//  VIPDemo
//
//  Created by Daniela Dias on 07/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import UIKit
import BaseViewSwift


// MARK: - ArtistView

/// _ArtistView_ is the main view for _ArtistViewController_
final class ArtistView: BaseView {

    let tableView = UITableView()
    let refreshControl = UIRefreshControl()

    private struct Constants {

        static let rowHeight: CGFloat = 60.0
    }


    // MARK: - Setup

    override func setup() {

        super.setup()

        setupBackground()
        setupTableView()
    }

    private func setupBackground() {

        backgroundColor = UIColor.white
    }

    private func setupTableView() {

        tableView.rowHeight = Constants.rowHeight
        tableView.separatorColor = UIColor.lightGray
        tableView.showsVerticalScrollIndicator = false
        tableView.insertSubview(refreshControl, at: 0)
        addSubview(tableView)
    }


    // MARK: - Layout

    override func setupConstraints() {

        super.setupConstraints()

        setupTableViewConstraints()
    }

    private func setupTableViewConstraints() {

        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
