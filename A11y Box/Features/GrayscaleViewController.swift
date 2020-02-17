//
//  GrayscaleViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 16/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class GrayscaleViewController: UIViewController {

    @IBOutlet weak private var grayscaleStatusLabel: UILabel!
    @IBOutlet weak private var apiStatusLight: UIImageView!
    @IBOutlet weak private var infrastructureStatusLight: UIImageView!
    @IBOutlet weak private var apiStatusLabel: UILabel!
    @IBOutlet weak private var infrastructureStatusLabel: UILabel!

    let circleImage = UIImage.init(named: "circle")
    let stopImage = UIImage.init(named: "octagon")
    let warnImage = UIImage.init(named: "warning")

    // Listing 8-23
    var grayscaleStatus: Bool {
        return UIAccessibility.isGrayscaleEnabled
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupDifferentiateLabel()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(grayscaleChanged),
                                               name: UIAccessibility.grayscaleStatusDidChangeNotification,
                                               object: nil)
    }

    private func setupDifferentiateLabel() {
        if grayscaleStatus {
            grayscaleStatusLabel.text = "FEATURE.GRAYSCALE.GRAYSCALE_ON".localized()

            let apiImage = stopImage?.withRenderingMode(.alwaysTemplate)
            let infrastructureImage = warnImage?.withRenderingMode(.alwaysTemplate)

            apiStatusLight.tintColor = .red
            infrastructureStatusLight.tintColor = .orange

            apiStatusLight.image = apiImage
            infrastructureStatusLight.image = infrastructureImage

            infrastructureStatusLabel.text = "FEATURE.GRAYSCALE.WARNING".localized()
            apiStatusLabel.text = "FEATURE.GRAYSCALE.CRITICAL".localized()

        } else {
            grayscaleStatusLabel.text = "FEATURE.GRAYSCALE.GRAYSCALE_OFF".localized()

            let apiImage = circleImage?.withRenderingMode(.alwaysTemplate)
            let infrastructureImage = circleImage?.withRenderingMode(.alwaysTemplate)

            apiStatusLight.tintColor = .red
            infrastructureStatusLight.tintColor = .orange

            apiStatusLight.image = apiImage
            infrastructureStatusLight.image = infrastructureImage

            infrastructureStatusLabel.text = ""
            apiStatusLabel.text = ""
        }
    }

    @objc
    func grayscaleChanged() {
        // check grayscaleStatus for current status.
        // Add shapes or text to add meaning.
        setupDifferentiateLabel()
    }
}
