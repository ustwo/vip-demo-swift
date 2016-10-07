//
//  ArtistViewController.swift
//  VIPDemo
//
//  Created by Daniela Dias on 07/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistViewController

class ArtistViewController: UIViewController {

    fileprivate let artistView = ArtistView()


    // MARK: - Initializers

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
    }


    // MARK: - View lifecycle

    override func loadView() {

        view = artistView
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        title = Strings.Artist.screenTitle
    }
}
