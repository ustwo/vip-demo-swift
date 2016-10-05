//
//  BaseView.swift
//
//  Created by Shagun Madhikarmi on 25/09/2014.
//  The MIT License (MIT)
//
//  Copyright (c) 2015 ustwo™
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import UIKit

/**
 BaseView acts as a common base for all custom views
*/
@objc open class BaseView: UIView {

    open fileprivate(set) var isSetup = false


    // MARK: - Initialisers

    override public init(frame: CGRect) {

        super.init(frame: frame)

        setup()
        setupAccessibility()
        setupConstraints()

        isSetup = true
    }

    required public init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
    }

    override open  func awakeFromNib() {

        super.awakeFromNib()

        // Since awakeFromNib can be called multiple times we check to see if setup routines have been called already for safety

        if !isSetup {

            setup()
            setupAccessibility()
            setupConstraints()

            isSetup = true
        }
    }


    // MARK: - Setup

    /**
     Abstract setup method for initial setup of the view and all its subviews.

     Override this function to initialize subviews, set default values, etc.
    */
    open func setup() {
        // Abstract method.
    }


    // MARK: - Accessibility

    /**
     Setup for the view's accessibility

     Override this function to add accessibility to their subviews (e.g. `accesibilityIdentifier`, `accessibilityLabel`, `accessibilityHint`, etc.).

     - Note: It is best to use this for static identifiers that will not change at runtime.
     For dynamically generated identifiers or identifiers that will change over time, we recommend doing this in the view controller or view model as appropriate.
    */
    open func setupAccessibility() {
        // Abstract method.
    }


    // MARK: - Constraints

    /**
     Abstract setup method for the view's constraints.

     Override this function to add layout constraints for all the subviews.
    */
    open func setupConstraints() {
        // Abstract method.
    }
}
