//
//  CreateTournamentCell.swift
//  Chess Tourney Matchup
//
//  Created by Ben Lee on 1/1/19.
//  Copyright © 2019 Ben Lee. All rights reserved.
//

import UIKit

class CreateRegularTournamentCollectionViewCell: UICollectionViewCell {
    
    var imgHeight: CGFloat? {
        didSet {
            setupViews(imgHeight: imgHeight!)
        }
    }
    
    let cellView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.rgb(red: 186, green: 200, blue: 212)
        v.layer.cornerRadius = 8

        return v
    }()
    
    let createTournamentImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "Icon1").withRenderingMode(.alwaysOriginal), highlightedImage:  nil)
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let createLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont(name: "Roboto-Regular", size: 22)
        l.textColor = UIColor.TEXTCOLOR()
        l.adjustsFontSizeToFitWidth = true
        l.text = "Create Regular Tournament"
        l.textAlignment = .left
        return l
    }()
    
    let descriptionLabel: UILabel = {
        let l = UILabel()
        let titleFont = UIFont(name: "Roboto-Regular", size: 16)
        let descriptionFont = UIFont(name: "Roboto-Light", size: 12)
        
        let textColor = UIColor.TEXTCOLOR()
        
        let attributes = [NSAttributedStringKey.font: titleFont, NSAttributedStringKey.foregroundColor: textColor]
        let attributedString = NSMutableAttributedString(string: "Create Regular Tournament", attributes: attributes)
        attributedString.append(NSAttributedString(string: "\n\n", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 8)]))
        
        attributedString.append(NSAttributedString(string: "Players play against others with similar scores and nobody gets eliminated.", attributes: [NSAttributedStringKey.font: descriptionFont]))
        l.attributedText = attributedString
        l.numberOfLines = 0
        l.adjustsFontSizeToFitWidth = true
        return l
    }()
    
    let placerView: UIView = {
        let vi = UIView()
        vi.backgroundColor = .clear
        return vi
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews(imgHeight: nil)
    }
    
    fileprivate func setupViews(imgHeight: CGFloat?) {
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 1

        addSubview(createTournamentImageView)
        createTournamentImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: imgHeight ?? 0, height: imgHeight ?? 0)

    
        
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: topAnchor, left: createTournamentImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
