//
//  matchupTableViewCell.swift
//  Chess Tourney Matchup
//
//  Created by Ben Lee on 12/23/18.
//  Copyright © 2018 Ben Lee. All rights reserved.
//

import UIKit

class matchupTableViewCell: UITableViewCell {
    
    var matchup: MatchPair? {
        didSet {
            matchupView.matchup = self.matchup
        }
    }
    
    let matchupView: MatchupView = {
        
        let mv = MatchupView()
        return mv
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    fileprivate func setupUI() {
        backgroundColor = .white
        layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer.borderWidth = 0.7
        
        addSubview(matchupView)
        matchupView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 45, paddingLeft: 20, paddingBottom: -35, paddingRight: 20, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
