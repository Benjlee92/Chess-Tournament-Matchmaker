//
//  HomeCollectionViewCell.swift
//  Chess Tourney Matchup
//
//  Created by Ben Lee on 1/1/19.
//  Copyright © 2019 Ben Lee. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        layer.cornerRadius = 8
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
