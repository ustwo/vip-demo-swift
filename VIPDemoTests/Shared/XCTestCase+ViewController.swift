//
//  XCTestCase+ViewController.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation
import UIKit
import XCTest

/// Extension of _XCTestCase_ for loading view controller

extension XCTestCase {

    // MARK: - Load view

    func loadView(window: UIWindow, viewController: UIViewController) {

        window.addSubview(viewController.view)
        RunLoop.current.run(until: Date())
    }
}
