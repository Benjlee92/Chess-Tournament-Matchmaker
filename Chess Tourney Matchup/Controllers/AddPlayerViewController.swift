//
//  AddPlayerViewController.swift
//  Chess Tourney Matchup
//
//  Created by Ben Lee on 12/22/18.
//  Copyright © 2018 Ben Lee. All rights reserved.
//

import UIKit

protocol AddPlayerDelegate: class {
    func addPlayerToTournament(player: Player)
}

class AddPlayerViewController: UIViewController {
    
    weak var delegate: AddPlayerDelegate?
    
    let mainView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 20
        v.layer.borderColor = UIColor.GRAY().cgColor
        v.layer.borderWidth = 1
        v.layer.shadowRadius = 20
        v.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        v.layer.shadowOpacity = 1
        v.layer.shadowOffset = CGSize.zero
        v.layer.shadowRadius = 10
        return v
    }()
    
    let xButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "xButton").withRenderingMode(.alwaysOriginal), for: .normal)
        button.setTitle("  Cancel", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 19)
        button.setTitleColor(UIColor.TEXTCOLOR(), for: .normal)
        //button.imageEdgeInsets
        button.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Player"
        label.font = UIFont(name: "Roboto-Regular", size: 45)
        label.textColor = UIColor.TEXTCOLOR()
        label.textAlignment = .center
        return label
    }()
    
    let topDivider: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.lightGray
        return v
    }()
    
    let midDivider: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.lightGray
        return v
    }()
    
    let nameLabel: UILabel = {
        let label =  UILabel()
        label.text = "NAME"
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let nameTF: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "NAME", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        tf.textColor = UIColor.TEXTCOLOR()
        tf.font = UIFont(name: "Roboto-Regular", size: 19)
        tf.isSelected = true
        return tf
    }()
    
    let ratingLabel: UILabel = {
        let label =  UILabel()
        label.text = "RATING"
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let ratingTF: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "RATING", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        tf.textColor = UIColor.TEXTCOLOR()
        tf.font = UIFont(name: "Roboto-Regular", size: 19)
        return tf
    }()
    
    let checkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "check").withRenderingMode(.alwaysOriginal), for: .normal)
        button.setTitle("  Add Player", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 19)
        button.setTitleColor(UIColor.TEXTCOLOR(), for: .normal)
        //button.imageEdgeInsets
        button.addTarget(self, action: #selector(addPlayer), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    func setupUI() {
        view.addSubview(mainView)
        mainView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 70, paddingLeft: 70, paddingBottom: -120, paddingRight: 70, width: 0, height: 0)
        
        mainView.addSubview(xButton)
        xButton.anchor(top: mainView.topAnchor, left: mainView.leftAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 120, height: 50)
        
        mainView.addSubview(titleLabel)
        titleLabel.anchor(top: mainView.topAnchor, left: mainView.leftAnchor, bottom: nil, right: mainView.rightAnchor, paddingTop: 70, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        mainView.addSubview(nameTF)
        nameTF.anchor(top: titleLabel.bottomAnchor, left: mainView.leftAnchor, bottom: nil, right: mainView.rightAnchor, paddingTop: 60, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 0)
        nameTF.isSelected = true
        
        mainView.addSubview(topDivider)
        topDivider.anchor(top: nameTF.bottomAnchor, left: mainView.leftAnchor, bottom: nil, right: mainView.rightAnchor, paddingTop: 25, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 1)
        
        mainView.addSubview(ratingTF)
        ratingTF.anchor(top: topDivider.bottomAnchor, left: mainView.leftAnchor, bottom: nil, right: nil, paddingTop: 25, paddingLeft: 40, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        mainView.addSubview(midDivider)
        midDivider.anchor(top: ratingTF.bottomAnchor, left: mainView.leftAnchor, bottom: nil, right: mainView.rightAnchor, paddingTop: 25, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 1)
        
        mainView.addSubview(checkButton)
        checkButton.anchor(top: nil, left: mainView.leftAnchor, bottom: mainView.bottomAnchor, right: mainView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -100, paddingRight: 0, width: 120, height: 50)
        
    }
    
    @objc func cancel() {
        dismiss(animated: true, completion:  nil)
    }
    
    @objc func addPlayer() {
        guard let name = nameTF.text else {return}
        var player = Player(name: nil, boardColor: nil, didWin: nil, didLose: nil, didDraw: nil, place: nil, totalWins: nil, totalLosses: nil, totalScore: nil, scores: nil, previousColor: nil)
        player.name = name
        
        dismiss(animated: true) {
            self.delegate?.addPlayerToTournament(player: player)
        }
        
        print("Add player pressed")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
