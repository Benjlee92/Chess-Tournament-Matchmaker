//
//  File.swift
//  Chess Tourney Matchup
//
//  Created by Ben Lee on 1/1/19.
//  Copyright © 2019 Ben Lee. All rights reserved.
//

import Foundation
import  UIKit

class CreateTournamentOptionsView: UIView {
    
    let titleLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont(name: "Roboto-Regular", size: 25)
        l.textColor = UIColor.TEXTCOLOR()
        l.text = "Create Tournament"
        l.textAlignment = .left
        return l
    }()
    
    let randomLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 16)
        l.textColor = UIColor.CHESSLIGHTBLACK()
        l.text = "Pair players randomly"
        l.textAlignment = .left
        return l
    }()
    
    let basedOnRatedLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 16)
        l.textColor = UIColor.CHESSLIGHTBLACK()
        l.text = "Pair players by rating"
        l.textAlignment = .left
        return l
    }()
    
    let randomSwitch: UISwitch = {
        let sw = UISwitch()
        sw.setOn(false, animated: false)
        
        return sw

    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        addSubview(randomSwitch)
        randomSwitch.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
