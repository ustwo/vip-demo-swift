//
//  ArtistItemView.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 07/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation
import BaseViewSwift

class ArtistItemView: BaseView {

    private let titleLabel = UILabel()
    private let imageView = UIImageView()

    var viewModel: ArtistViewModel? {

        didSet {

            titleLabel.text = viewModel?.title
            setImageURL(url: viewModel?.imageURL)
        }
    }

    private struct Constants {

        struct Margin {

            static let left: CGFloat = 10.0
        }

        struct Alpha {

            static let transparency: CGFloat = 0.6
        }
    }


    // MARK: - Setup

    override func setup() {

        super.setup()

        setupImageView()
        setupTitleLabel()
    }

    private func setupImageView() {

        imageView.contentMode = .scaleToFill
        imageView.alpha = Constants.Alpha.transparency
        addSubview(imageView)
    }

    private func setupTitleLabel() {

        titleLabel.textColor = UIColor.white
        addSubview(titleLabel)
    }


    // MARK: - Constraints

    override func setupConstraints() {

        super.setupConstraints()

        setupTitleLabelConstraints()
        setupImageViewConstraints()
    }

    private func setupImageViewConstraints() {

        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true


    }

    private func setupTitleLabelConstraints() {

        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }


    // MARK: - Image

    func setImageURL(url: URL?) {

        guard let imageURL = url else {

            imageView.image = nil

            return
        }

        let request = URLRequest(url: imageURL)

        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        NetworkClient.sharedInstance.sendRequest(request: request) { [weak self] data, response, error in

            UIApplication.shared.isNetworkActivityIndicatorVisible = false

            if let strongSelf = self {

                if let imageData = data, let image = UIImage(data: imageData) {

                    print("imageSize: \(image.size)")

                    if let responseURL = response?.url, responseURL == imageURL {

                        strongSelf.imageView.image = image
                    }

                } else {

                    strongSelf.imageView.image = nil
                }
            }
        }
    }
}
