//
//  matchupTableViewCell.swift
//  Chess Tourney Matchup
//
//  Created by Ben Lee on 12/23/18.
//  Copyright © 2018 Ben Lee. All rights reserved.
//

import UIKit

class MatchupTableViewCell: UITableViewCell {
    
    var result: MatchPair? {
        didSet {
            showResultOverlay(matchup: result!)
        }
    }
    
    var matchUp: MatchPair? {
        didSet {
            matchupView.matchup = matchUp
        }
    }
    
    let matchupView: MatchupView = {
        let mv = MatchupView()
        return mv
    }()
    
    let border: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.GRAY()
        return v
    }()
    
    let resultOverlay: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.rgb(red: 101, green: 154, blue: 244)
        v.alpha = 0.92
        v.isHidden = true
        return v
    }()
    
    let resultLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.font = UIFont(name: "Roboto-Regular", size: 20)
        lbl.textAlignment = .center
        lbl.textColor = UIColor.white
        return lbl
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "CellId")
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        backgroundColor = .white
        layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer.borderWidth = 0.7
        
        addSubview(matchupView)
        matchupView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 45, paddingLeft: 30, paddingBottom: -35, paddingRight: 30, width: 0, height: 0)
        
        addSubview(border)
        border.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        addSubview(resultOverlay)
        resultOverlay.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        resultOverlay.addSubview(resultLabel)
        resultLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func showResultOverlay(matchup: MatchPair) {
        let player1 = matchup.player1
        let player2 = matchup.player2
        
        if matchup.player1.didWin {
            resultLabel.text = "\(player1.name) Won the round!"
        } else if matchup.player2.didWin {
            resultLabel.text = "\(player2.name) Won the round!"
        } else if player1.didDraw && player2.didDraw {
            resultLabel.text = "\(player1.name) and \(player2.name) both drew the round!"
        }
        
        resultOverlay.isHidden = false
    }
    
    func hideOverlay() {
        resultOverlay.isHidden = true
    }

}
