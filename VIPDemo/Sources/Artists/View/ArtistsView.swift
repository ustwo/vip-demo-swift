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


    // MARK: - Setup

    override func setup() {

        super.setup()

        setupTableView()
    }

    private func setupTableView() {

        addSubview(tableView)
    }


    // MARK: - Layout

    override func setupConstraints() {

        super.setupConstraints()

        setupTableViewConstraints()
    }

    private func setupTableViewConstraints() {

        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.topAnchor.constraint(equalTo: topAnchor)
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor)
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
    }
}
