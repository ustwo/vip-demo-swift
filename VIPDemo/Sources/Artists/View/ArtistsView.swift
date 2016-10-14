//
//  ArtistsView.swift
//  VIPDemo
//
//  Created by Daniela Dias on 05/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import UIKit
import BaseViewSwift


// MARK: - ArtistsView

/// _ArtistsView_ is the main view for _ArtistsViewController_
final class ArtistsView: BaseView {

    let tableView = UITableView()
    let refreshControl = UIRefreshControl()

    private struct Constants {

        static let rowHeight: CGFloat = 160.0
    }


    // MARK: - Setup

    override func setup() {

        super.setup()

        setupTableView()
    }

    private func setupTableView() {

        tableView.rowHeight = Constants.rowHeight
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor.white
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
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
