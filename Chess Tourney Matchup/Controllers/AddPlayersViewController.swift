//
//  ViewController.swift
//  Chess Tourney Matchup
//
//  Created by Ben Lee on 12/5/18.
//  Copyright © 2018 Ben Lee. All rights reserved.
//

import UIKit

class AddPlayersViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, AddPlayerDelegate, UITextFieldDelegate {
    
    var numberOfPlayers = 0
    var numberOfRounds = 0

    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Add Players"
        lbl.font = UIFont(name: "Roboto-Regular", size: 22)
        lbl.textAlignment = .center
        lbl.textColor = UIColor.TEXTCOLOR()
        return lbl
    }()
    
    let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Add players to enter in the tournament."
        lbl.font = UIFont(name: "Roboto-Regular", size: 14)
        lbl.textAlignment = .center
        lbl.textColor = UIColor.TEXTCOLOR()
        return lbl
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = false
       // cv.layer.shadowRadius = 40
        return cv
    }()
    
    let addPlayerButton: UIButton = {
        let button = UIButton(type: .system)
        let font = UIFont(name: "Roboto-Medium", size: 15)
        let attributes = [NSAttributedStringKey.font: font, NSAttributedStringKey.foregroundColor: UIColor.white]
        let attributedString = NSAttributedString(string: "AddPlayer", attributes: attributes)
        button.setAttributedTitle(attributedString, for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.rgb(red: 45, green: 193, blue: 222)
        //button.imageEdgeInsets
        button.addTarget(self, action: #selector(addPlayer), for: .touchUpInside)
        return button
    }()
    
    let startTournamentButton: UIButton = {
        let button = UIButton(type: .system)
        let font = UIFont(name: "Roboto-Medium", size: 15)
        let attributes = [NSAttributedStringKey.font: font, NSAttributedStringKey.foregroundColor: UIColor.white]
        let attributedString = NSAttributedString(string: "Start Tournament", attributes: attributes)
        button.setAttributedTitle(attributedString, for: .normal)
        button.backgroundColor = UIColor.rgb(red: 41, green:203 , blue: 152)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(startTournament), for: .touchUpInside)
        return button
    }()
    var currentTextFieldName = ""
    var playerNames: [String] = []
    var playersList: [Player] = []
    var playersListWithSameWins: [Player] = []
    var matchPairs: [MatchPair] = []
    var allMatchPairs: [MatchPair] = []
    var results: [Player] = []
    var roundWinners: [Player] = []
    var roundLosers: [Player] = []
    var playersWithSameWins: [Player] = []
    
    var currentRound = 0
    
    let white = "White"
    let black = "Black"
    let colors = ["White", "Black"]
    let cellId = "cellId"
    let noPlayerCellId = "noPlayerCellId"
    let addPlayerCellId = "addPlayerCellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        descriptionLabel.anchor(top: navigationController?.navigationBar.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 20)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI() {
        navigationController?.navigationBar.topItem?.title = "Cancel"
        navigationItem.title = "Add Players"
        view.backgroundColor = UIColor.GRAY()
        
        view.addSubview(descriptionLabel)
        descriptionLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 20)
        
        let buttonStackView = UIStackView(arrangedSubviews: [addPlayerButton, startTournamentButton])
        addPlayerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        startTournamentButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 50
        
        view.addSubview(buttonStackView)
        buttonStackView.anchor(top: descriptionLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 25, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
        view.addSubview(collectionView)
        collectionView.anchor(top: addPlayerButton.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        registerCells()
    }
    
    fileprivate func registerCells() {
        collectionView.register(PlayerCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(NoPlayerCell.self, forCellWithReuseIdentifier: noPlayerCellId)
        collectionView.register(AddPlayerCollectionViewCell.self, forCellWithReuseIdentifier: addPlayerCellId)

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let addPlayerCell = collectionView.dequeueReusableCell(withReuseIdentifier: addPlayerCellId, for: indexPath) as! AddPlayerCollectionViewCell
        addPlayerCell.number = String(indexPath.item + 1)
        addPlayerCell.nameTextField.delegate = self
        return addPlayerCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("SELECTED")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return numberOfPlayers
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField.text != "") || (textField.text != "Add Player Name") {
            currentTextFieldName = textField.text!
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("ended")
        if textField.text != "" || textField.text != "Add Player Name" {
            let playerName = textField.text ?? ""
            if playerNames.contains(textField.text!) {
                print("name already in use ")
            } else {
                if let index = playerNames.index(of: currentTextFieldName) {
                    playerNames[index] = playerName
                    print("hot here")
                } else {
                    playerNames.append(playerName)
                }
            }
        } else if textField.text == "" {
        }
        print(playerNames)
        print("playerNames: \(playerNames)")
        print("player Count: \(playerNames.count)")

        return true
    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        print("ended")
//        if textField.text != "" || textField.text != "Add Player Name" {
//            guard let playerName = textField.text else {return}
//
//            if playerNames.contains(textField.text!) {
//                print("name already in use ")
//            } else {
//                if let index = playerNames.index(of: currentTextFieldName) {
//                    playerNames[index] = playerName
//                    print("hot here")
//                } else {
//                    playerNames.append(playerName)
//                }
//            }
//        } else if textField.text == "" {
//        }
//        print(playerNames)
//
//    }
    
    
    func setPlayerNames() {
        for name in playerNames {
            let player = Player(name: name, boardColor: nil, didWin: false, didLose: false, didDraw: false, place: nil, totalWins: 0, totalLosses: 0, totalScore: 0, scores: nil, previousColor: nil)
            playersList.append(player)
        }
        print("PlayerList: \(playersList)")

    }
    
    @objc func addPlayer() {
        let addPlayerViewController = AddPlayerViewController()
        addPlayerViewController.delegate = self
        addPlayerViewController.modalPresentationStyle = .overCurrentContext
        present(addPlayerViewController, animated: true, completion: nil)
    }
    
    @objc func startTournament() {
        setPlayerNames()
        setPairs(playerList: playersList)
        setColors()
        listMatchUps()
        toTournamentViewController()
    }
    
    func checkIfAllNamesGiven() {
        
    }
    
    func toTournamentViewController() {
        let tournamentVC = TournamentViewController()
        tournamentVC.matchPairs = matchPairs

        tournamentVC.numberOfMatchPairs = matchPairs.count
        navigationController?.pushViewController(tournamentVC, animated: true)
        //tournamentVC.numberOfRounds = numberOfROunds()
        //self.allMatchPairs.removeAll()
//        present(tournamentVC, animated: true) {
//            self.allMatchPairs.removeAll()
//        }
    }
    
    func addPlayerToTournament(player: Player) {
        playersList.append(player)
        collectionView.reloadData()
    }
    
    func setPairs(playerList: [Player]) {
        if currentRound == 0 {
            if playerList.count % 2 == 0 { // check if we have even number of players

                // Here we need to randomly set two people together
                var playersListHolder: [Player] = []
                for player in playersList {
                    playersListHolder.append(player)
                }

                let numberOfMatchPairs = playersListHolder.count / 2
                var mPair = MatchPair(player1: nil, player2: nil, players: nil, result: nil, matchComplete: nil)
                for index in 1...numberOfMatchPairs { // looping through the number of pairs

                    var pair : [Player] = []

                    for index in 1...2 { // loop through twice to pick 2 people
                        let randomIndex = Int(arc4random_uniform(UInt32(playersListHolder.count))) // getting a random index
                        let player = playersListHolder[randomIndex]
                        pair.append(player)
                        playersListHolder.remove(at: randomIndex)
                    }

                    mPair.player1 = pair[0]
                    mPair.player2 = pair[1]

                    mPair.player1.boardColor = "White"
                    mPair.player2.boardColor = "Black"
                    matchPairs.append(mPair)
                    pair.removeAll()
                }
            } else {
                print("ODD NUMBER OF PLAYERS")
            }
        } else {
        }
        //print("MatchPairs: \(matchPairs)")
        //print("MatchPair count:  \(matchPairs.count)")
    }
    
    func setColors() { // setting the colors for the players
        for matchPair in matchPairs {
            var player1Color = matchPair.player1.boardColor
            var player2Color = matchPair.player2.boardColor
            
            if player1Color == player2Color {
                player1Color = "White"
                player2Color = "Black"
            } else {
                if player1Color == "White" {
                    player1Color = "Black"
                    player2Color = "White"
                } else if player1Color == "Black" {
                    player1Color = "White"
                    player2Color = "Black"
                }
            }
        }
    }
    
    func listMatchUps() {
            print("-------------------- Round 1 ----------------------\n")
            
            for matchPair in matchPairs {
                var player1 = matchPair.player1
                var player2 = matchPair.player2
                
                print(player1.boardColor + ": " + player1.name, "(\(String(player1.totalWins))W \(String(player1.totalLosses))L)" + "   VS   " + player2.boardColor + ": " + player2.name, "(\(String(player2.totalWins))W \(String(player2.totalLosses))L)")
            }
            print("\n")
    }
    
    func beginFirstRound() {
        setColors()
        listMatchUps()
    }
}


