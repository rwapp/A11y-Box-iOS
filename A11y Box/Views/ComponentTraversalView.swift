//
//  ComponentTraversalView.swift
//  A11y Box
//
//  Created by Martin Wright on 29/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class ComponentTraversalView: UIView {

    @IBOutlet weak var tile1: TileView!
    @IBOutlet weak var tile2: TileView!
    @IBOutlet weak var tile3: TileView!
    var tileDetails: [(String, String)]? {
        didSet {
            updateView()
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let view = UINib(nibName: "ComponentTraversalView",
                         bundle: Bundle.main).instantiate(withOwner: self,
                                                          //swiftlint:disable:next force_cast
                            options: nil).first as! UIView
        view.frame = bounds
        addSubview(view)
    }
    
    func updateView() {
        if let tiles = tileDetails {
            tile1.tileDetails = tiles[0]
            tile2.tileDetails = tiles[1]
            tile3.tileDetails = tiles[2]
        }
    }
}
