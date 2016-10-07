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

class ArtistsView: BaseView {

    let tableView = UITableView()

    private struct Constants {

        static let estimatedRowHeight: CGFloat = 120.0
    }


    // MARK: - Setup

    override func setup() {

        super.setup()

        setupTableView()
    }

    private func setupTableView() {

        tableView.estimatedRowHeight = 160.0
        tableView.rowHeight = 160.0
        tableView.separatorStyle = .none

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
