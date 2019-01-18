//
//  V.swift
//  Chess Tourney Matchup
//
//  Created by Ben Lee on 12/23/18.
//  Copyright © 2018 Ben Lee. All rights reserved.
//

import UIKit

class MatchupView: UIView {
    
    var matchup: MatchPair? {
        didSet {
            let player1 = matchup!.player1
            let player2 = matchup!.player2
            
            if matchup?.player1.boardColor == "White" {
                player1NameLabel.attributedText = setAttributedText(player: player1)
                player2NameLabel.attributedText = setAttributedText(player: player2)
            } else if matchup?.player1.boardColor == "Black" {
                player2NameLabel.attributedText = setAttributedText(player: player1)
                player1NameLabel.attributedText = setAttributedText(player: player2)
            } else {
                print ("something is going wrong")
            }
        }
    }
    
    
    
    func setAttributedText(player: Player) -> NSMutableAttributedString {
        let name = player.name
        let wins = player.totalWins
        let losses = player.totalLosses
        let statsString = "\n(" + String(wins) + "W - " + String(losses) + "L)"
        let attributedText = NSMutableAttributedString(string: name + "  ", attributes: [NSAttributedStringKey.font : UIFont(name: "Roboto-Regular", size: 20)])
        
        attributedText.append(NSAttributedString(string: statsString , attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15), NSAttributedStringKey.foregroundColor: UIColor.gray]))
        return attributedText
    }
    
   
    
    let blackImageView: UIImageView = {
        let iv =  UIImageView(image: #imageLiteral(resourceName: "blackColor"))
        iv.clipsToBounds = true
        return iv
    }()
    
    let whiteImageView: UIImageView = {
        let iv =  UIImageView(image: #imageLiteral(resourceName: "whiteColor"))
        iv.clipsToBounds = true
        return iv
    }()
    
    let whiteColorLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "White"
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "Roboto-Regular", size: 12)
        lbl.textColor = UIColor.gray
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    let blackColorLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Black"
        lbl.font = UIFont(name: "Roboto-Regular", size: 12)
        lbl.textAlignment = .center
        lbl.textColor = UIColor.gray
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    let player1NameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Player1"
        lbl.font = UIFont(name: "Roboto-Regular", size: 13)
        lbl.textColor = UIColor.TEXTCOLOR()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines = 0

        return lbl
    }()
    
    let player2NameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Player2"
        lbl.font = UIFont(name: "Roboto-Regular", size: 13)
        lbl.textAlignment = .right
        lbl.textColor = UIColor.TEXTCOLOR()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let vsLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "VS"
        lbl.font = UIFont(name: "Roboto-Regular", size: 15)
        lbl.textAlignment = .center
        lbl.textColor = UIColor.gray
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(whiteImageView)
        whiteImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        
        addSubview(blackImageView)
        blackImageView.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        
        addSubview(whiteColorLabel)
        whiteColorLabel.anchor(top: nil, left: nil, bottom: whiteImageView.topAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: -5, paddingRight: 0, width: 0, height: 20)
        whiteColorLabel.centerXAnchor.constraint(equalTo: whiteImageView.centerXAnchor).isActive = true
        
        addSubview(blackColorLabel)
        blackColorLabel.anchor(top: nil, left: nil, bottom: blackImageView.topAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: -5, paddingRight: 0, width: 0, height: 20)
        blackColorLabel.centerXAnchor.constraint(equalTo: blackImageView.centerXAnchor).isActive = true
        
        addSubview(vsLabel)
        vsLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 40, height: 0)
        vsLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        vsLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        addSubview(player1NameLabel)
        player1NameLabel.anchor(top: whiteImageView.topAnchor, left: whiteImageView.rightAnchor, bottom: whiteImageView.bottomAnchor, right: vsLabel.leftAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
        addSubview(player2NameLabel)
        player2NameLabel.anchor(top: blackImageView.topAnchor, left: vsLabel.rightAnchor, bottom: blackImageView.bottomAnchor, right: blackImageView.leftAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 120, height: 0)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    

}
