//
//  ErrorPresenter.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation
import UIKit


/// _ErrorPresenter_ is a protocol for presenting errors

protocol ErrorPresenter {

    /// Present an error given an error view model
    ///
    /// - parameter viewModel: The view model for the error
    func presentError(viewModel: ErrorViewModel)
}


/// Extension of _ErrorPresenter_ protocol for common view controller error handling

extension ErrorPresenter where Self: UIViewController {

    /// Presents an error for a view controller using an alert
    ///
    /// - parameter viewModel: The view model for the error
    func presentError(viewModel: ErrorViewModel) {

        let alertController = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)

        if let buttonTitles = viewModel.buttonTitles {

            for title in buttonTitles {

                let action = UIAlertAction(title: title, style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(action)
            }
        }

        present(alertController, animated: true, completion: nil)
    }
}
