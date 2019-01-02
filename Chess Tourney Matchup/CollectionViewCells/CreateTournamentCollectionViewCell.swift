//
//  CreateTournamentCell.swift
//  Chess Tourney Matchup
//
//  Created by Ben Lee on 1/1/19.
//  Copyright © 2019 Ben Lee. All rights reserved.
//

import UIKit

class CreateTournamentCollectionViewCell: UICollectionViewCell {
    
    let cellView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.rgb(red: 186, green: 200, blue: 212)
        v.layer.cornerRadius = 8

        return v
    }()
    
    let creatTournamentImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "CreateTourney").withRenderingMode(.alwaysOriginal), highlightedImage:  nil)
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 8
        return iv
    }()
    
    let createLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont(name: "Roboto-Regular", size: 27)
        l.textColor = UIColor.white
        l.text = "Create Tournament"
        l.textAlignment = .left
        return l
    }()
    
    let placerView: UIView = {
        let vi = UIView()
        vi.backgroundColor = .clear
        return vi
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    fileprivate func setupViews() {
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 1

        addSubview(creatTournamentImageView)
        creatTournamentImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(placerView)
        placerView.anchor(top: creatTournamentImageView.topAnchor, left: creatTournamentImageView.leftAnchor, bottom: creatTournamentImageView.bottomAnchor, right: creatTournamentImageView.centerXAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(createLabel)
        createLabel.anchor(top: placerView.topAnchor, left: placerView.leftAnchor, bottom: nil, right: placerView.rightAnchor, paddingTop: 40, paddingLeft: 35, paddingBottom: 0, paddingRight: 0, width: 0, height: 25)
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
