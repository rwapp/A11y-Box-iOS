//
//  ReduceMotionViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 17/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class ReduceMotionViewController: UIViewController {

    @IBOutlet weak private var statusLabel: UILabel!

    var reduceMotionStatus: Bool {
        return UIAccessibility.isReduceMotionEnabled
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(reduceMotionChanged),
                                               name: UIAccessibility.reduceMotionStatusDidChangeNotification,
                                               object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        statusLabel.center = view.center
        setupAnimation()
    }

    private func setupAnimation() {
        if reduceMotionStatus {
            statusLabel.textColor = .black
            statusLabel.text = "FEATURE.ANIMATION.ENABLED".localized()
        } else {
            statusLabel.text = "FEATURE.ANIMATION.DISABLED".localized()
            animate()
        }

    }

    private func changeColor() {
        statusLabel.textColor = randomColor()
    }

    private func moveRight() {
        statusLabel.center = CGPoint(x: view.frame.width - statusLabel.frame.width, y: statusLabel.center.y)
    }

    private func moveLeft() {
        statusLabel.center = CGPoint(x: 0 + statusLabel.frame.width, y: statusLabel.center.y)
    }

    private func animate() {
        if !reduceMotionStatus {
            UIView.animate(withDuration: 2.5,
                           animations: {
                            self.changeColor()
                            self.moveRight()

            }) { _ in
                UIView.animate(withDuration: 2.5, animations: {
                    self.moveLeft()
                    self.changeColor()
                }) { _ in
                    self.animate()
                }
            }
        }
    }

    @objc
    func reduceMotionChanged() {
        // check reduceMotionStatus for current status.
        // stop or reduce the intensity of animation.
        setupAnimation()
    }

    private func randomColor() -> UIColor {
        return UIColor(red: random(),
                       green: random(),
                       blue: random(),
                       alpha: 1.0)
    }

    private func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
