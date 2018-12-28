//
//  NoPlayerCellCollectionViewCell.swift
//  Chess Tourney Matchup
//
//  Created by Ben Lee on 12/23/18.
//  Copyright © 2018 Ben Lee. All rights reserved.
//

import UIKit

class NoPlayerCell: UICollectionViewCell {
    
    let noPlayerLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Roboto-Regular", size: 15)
        lbl.textColor = UIColor.lightGray
        lbl.text = "No players are in the tournament."
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(noPlayerLabel)
        noPlayerLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
