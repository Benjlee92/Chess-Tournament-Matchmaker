//
//  V.swift
//  Chess Tourney Matchup
//
//  Created by Ben Lee on 12/23/18.
//  Copyright © 2018 Ben Lee. All rights reserved.
//

import UIKit

class MatchupView: UIView {
    
    var player1: Player? {
        didSet {
            
        }
    }
    
    var player2: Player? {
        didSet {
            
        }
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
        lbl.font = UIFont(name: "Roboto-Regular", size: 45)
        lbl.textColor = UIColor.TEXTCOLOR()
        return lbl
    }()
    
    let blackColorLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Black"
        lbl.font = UIFont(name: "Roboto-Regular", size: 45)
        lbl.textColor = UIColor.TEXTCOLOR()
        return lbl
    }()
    
    let player1NameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Player1"
        lbl.font = UIFont(name: "Roboto-Regular", size: 25)
        lbl.textColor = UIColor.TEXTCOLOR()
        return lbl
    }()
    
    let player2NameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Player2"
        lbl.font = UIFont(name: "Roboto-Regular", size: 25)
        lbl.textColor = UIColor.TEXTCOLOR()
        return lbl
    }()
    
    let vsLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "VS"
        lbl.font = UIFont(name: "Roboto-Regular", size: 40)
        lbl.textColor = UIColor.TEXTCOLOR()
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(whiteImageView)
        whiteImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        
        addSubview(blackImageView)
        blackImageView.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
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
