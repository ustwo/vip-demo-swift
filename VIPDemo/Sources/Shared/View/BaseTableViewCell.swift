//
//  BaseTableViewCell.swift
//  VIPDemo
//
//  Created by Daniela Dias on 07/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - BaseTableViewCell

class BaseTableViewCell: UITableViewCell {


    // MARK: - Initializers

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
    }


    // MARK: - Setup

    open func setup() {

        // Abstract method.
    }


    // MARK: - Layout

    open func setupConstraints() {

        // Abstract method.
    }


    // MARK: - Reuse Identifier

    open class func reuseIdentifier() -> String {

        return NSStringFromClass(self)
    }
}
