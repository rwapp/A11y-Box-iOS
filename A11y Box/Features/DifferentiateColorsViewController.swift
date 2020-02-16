//
//  DifferentiateColorsViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 16/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class DifferentiateColorsViewController: UIViewController {

    @IBOutlet weak private var differentiateColorStatusLabel: UILabel!
    @IBOutlet weak private var apiStatusLight: UIImageView!
    @IBOutlet weak private var infrastructureStatusLight: UIImageView!
    @IBOutlet weak private var apiStatusLabel: UILabel!
    @IBOutlet weak private var infrastructureStatusLabel: UILabel!

    let circleImage = UIImage.init(named: "circle")
    let stopImage = UIImage.init(named: "octagon")
    let warnImage = UIImage.init(named: "warning")

    var differentiateWithoutColorStatus: Bool {
        return UIAccessibility.shouldDifferentiateWithoutColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupDifferentiateLabel()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(differentiateWithoutColorChanged),
                                               name: NSNotification.Name(rawValue: UIAccessibility.differentiateWithoutColorDidChangeNotification),
                                               object: nil)
    }

    private func setupDifferentiateLabel() {
        if differentiateWithoutColorStatus {
            differentiateColorStatusLabel.text = "FEATURE.DIFFERENTIATE_COLOR.DIFFERENTIATE_COLOR_ON".localized()

            let apiImage = stopImage?.withRenderingMode(.alwaysTemplate)
            let infrastructureImage = warnImage?.withRenderingMode(.alwaysTemplate)

            apiStatusLight.tintColor = .red
            infrastructureStatusLight.tintColor = .orange

            apiStatusLight.image = apiImage
            infrastructureStatusLight.image = infrastructureImage

            infrastructureStatusLabel.text = "FEATURE.DIFFERENTIATE_COLOR.WARNING".localized()
            apiStatusLabel.text = "FEATURE.DIFFERENTIATE_COLOR.CRITICAL".localized()

        } else {
            differentiateColorStatusLabel.text = "FEATURE.DIFFERENTIATE_COLOR.DIFFERENTIATE_COLOR_OFF".localized()

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
    func differentiateWithoutColorChanged() {
        // check differentiateWithoutColorStatus for current status.
        // Add shapes or text to add meaning.
        setupDifferentiateLabel()
    }
}
