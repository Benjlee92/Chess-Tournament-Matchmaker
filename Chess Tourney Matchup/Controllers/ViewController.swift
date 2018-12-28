//
//  ViewController.swift
//  Chess Tourney Matchup
//
//  Created by Ben Lee on 12/5/18.
//  Copyright © 2018 Ben Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, AddPlayerDelegate {
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Add Players"
        lbl.font = UIFont(name: "Roboto-Regular", size: 50)
        lbl.textAlignment = .center
        lbl.textColor = UIColor.TEXTCOLOR()
        return lbl
    }()
    
    let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Add players to enter in the tournament"
        lbl.font = UIFont(name: "Roboto-Regular", size: 19)
        lbl.textAlignment = .center
        lbl.textColor = UIColor.TEXTCOLOR()
        return lbl
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = true
       // cv.layer.shadowRadius = 40
        return cv
    }()
    
    let addPlayerButton: UIButton = {
       let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "AddButton").withRenderingMode(.alwaysOriginal), for: .normal)
        button.setTitle("  Add Player", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 19)
        button.setTitleColor(UIColor.TEXTCOLOR(), for: .normal)
        //button.imageEdgeInsets
        button.addTarget(self, action: #selector(addPlayer), for: .touchUpInside)
        return button
    }()
    
    let startTournamentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "startTournament").withRenderingMode(.alwaysOriginal), for: .normal)
        button.setTitle("  Start Tournament", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 19)
        button.setTitleColor(UIColor.TEXTCOLOR(), for: .normal)
        //button.imageEdgeInsets
        button.addTarget(self, action: #selector(startTournament), for: .touchUpInside)
        return button
    }()
    
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        //getPlayers()
        //setPairs(playerList: playersList)
        //setPairs(players)
        //beginFirstRound()
        //setScore()
        //beginNextRound()

    }
    
    override func viewDidAppear(_ animated: Bool) {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI() {
        view.backgroundColor = UIColor.GRAY()
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 100, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(descriptionLabel)
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(addPlayerButton)
        addPlayerButton.anchor(top: descriptionLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 70, paddingBottom: 0, paddingRight: 0, width: 150, height: 50)
        
        view.addSubview(startTournamentButton)
        startTournamentButton.anchor(top: descriptionLabel.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 50, paddingLeft: 0, paddingBottom: 0, paddingRight: 70, width: 220, height: 50)
        
        view.addSubview(collectionView)
        collectionView.anchor(top: addPlayerButton.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 50, paddingLeft: 70, paddingBottom: -70, paddingRight: 70, width: 0, height: 0)
        
        
        registerCells()
    }
    
    fileprivate func registerCells() {
        collectionView.register(PlayerCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(NoPlayerCell.self, forCellWithReuseIdentifier: noPlayerCellId)

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if playersList.count == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: noPlayerCellId, for: indexPath) as! NoPlayerCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PlayerCell
            cell.player = playersList[indexPath.item]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("SELECTED")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if playersList.count == 0 {
            return 1
        } else {
            return playersList.count

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    @objc func addPlayer() {
        let addPlayerViewController = AddPlayerViewController()
        addPlayerViewController.delegate = self
        addPlayerViewController.modalPresentationStyle = .overCurrentContext
        present(addPlayerViewController, animated: true, completion: nil)

    }
    
    @objc func startTournament() {
        setPairs(playerList: playersList)
        setColors()
        listMatchUps()
        toTournamentViewController()
    }
    
    func toTournamentViewController() {
        let tournamentVC = TournamentViewController()
        tournamentVC.matchPairs = allMatchPairs
        present(tournamentVC, animated: true) {
            self.allMatchPairs.removeAll()
        }
    }
    
    func addPlayerToTournament(player: Player) {
        playersList.append(player)
        collectionView.reloadData()
    }
    
    func getPlayers() {
        var playerNames = ["Alex", "Ben", "Cam", "Dan", "Ed", "Fred"]
        for name in playerNames {
            var player = Player(name: nil, boardColor: nil, didWin: nil, didLose: nil, didDraw: nil, place: nil, totalWins: nil, totalLosses: nil, totalScore: nil, scores: nil, previousColor: nil)
            player.name = name
            playersList.append(player)
        }
    }
    
    func setPairs(playerList: [Player]) {
        matchPairs.removeAll()

        if currentRound == 0 {
            if playerList.count % 2 == 0 { // check if we have even number of players
                
                // Here we need to randomly set two people together
                var playersListHolder = playerList
                
                let numberOfMatchPairs = playersListHolder.count / 2
                var matchPair = MatchPair(player1: nil, player2: nil, players: nil)
                for index in 1...numberOfMatchPairs { // looping through the number of pairs
                    
                    var pair : [Player] = []
                    
                    for index in 1...2 { // loop through twice to pick 2 people
                        let randomIndex = Int(arc4random_uniform(UInt32(playersListHolder.count))) // getting a random index
                        let player = playersListHolder[randomIndex]
                        pair.append(player)
                        playersListHolder.remove(at: randomIndex)
                    }
                    matchPair.player1 = pair[0]
                    matchPair.player2 = pair[1]
                    
                    matchPair.player1.boardColor = "White"
                    matchPair.player2.boardColor = "Black"
                    matchPairs.append(matchPair)
                    allMatchPairs.append(matchPair)
                    pair.removeAll()
                }
            } else {
                print("ODD NUMBER OF PLAYERS")
            }
            
        } else if currentRound > 0 {
            if playerList.count % 2 == 0 { // check if we have even number of players
                
                // Here we need to randomly set two people together
                var playersListHolder = playerList
                
                let numberOfMatchPairs = playersListHolder.count / 2
                var matchPair = MatchPair(player1: nil, player2: nil, players: nil)
                for index in 1...numberOfMatchPairs { // looping through the number of pairs
                    
                    var pair : [Player] = []
                    
                    for index in 1...2 { // loop through twice to pick 2 people
                        let randomIndex = Int(arc4random_uniform(UInt32(playersListHolder.count))) // getting a random index
                        let player = playersListHolder[randomIndex]
                        pair.append(player)
                        playersListHolder.remove(at: randomIndex)
                    }
                    matchPair.player1 = pair[0]
                    matchPair.player2 = pair[1]
                    
                    var player1PreviousBoardColor = matchPair.player1.boardColor
                    var player2PreviousBoardColor = matchPair.player2.boardColor

                    
                    if player1PreviousBoardColor == "White" && player2PreviousBoardColor == "Black" {
                        matchPair.player1.boardColor = "Black"
                        matchPair.player2.boardColor = "White"

                    } else if player1PreviousBoardColor == "Black" && player2PreviousBoardColor == "White" {
                        matchPair.player1.boardColor = "White"
                        matchPair.player2.boardColor = "Black"
                    } else {
                        matchPair.player1.boardColor = "White"
                        matchPair.player2.boardColor = "Black"

                    }
                    
                    matchPairs.append(matchPair)
                    allMatchPairs.append(matchPair)
                    pair.removeAll()
                }
            } else {
            }
        }
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
        if currentRound == 0 { // checking to see if this should be the first round
            currentRound = 1
            print("-------------------- Round 1 ----------------------\n")
            
            for matchPair in matchPairs {
                var player1 = matchPair.player1
                var player2 = matchPair.player2
                
                print(player1.boardColor + ": " + player1.name, "(\(String(player1.totalWins))W \(String(player1.totalLosses))L)" + "   VS   " + player2.boardColor + ": " + player2.name, "(\(String(player2.totalWins))W \(String(player2.totalLosses))L)")
            }
            print("\n")
            
        } else {
            for matchPair in matchPairs {
                var player1 = matchPair.player1
                var player2 = matchPair.player2
                
                print(player1.boardColor + ": " + player1.name, "(\(String(player1.totalWins))W \(String(player1.totalLosses))L)" + "   VS   " + player2.boardColor + ": " + player2.name, "(\(String(player2.totalWins))W \(String(player2.totalLosses))L)")
            }
            
        }
    }
    
    
    func beginFirstRound() {
        //currentRound += 1
        setColors()
        listMatchUps()
    }
    
    func setScore() {

        for matchPair in matchPairs {
            // temporary setting of the winners and losers NEED TO CHANGE
            var player1 = matchPair.player1
            var player2 = matchPair.player2

            player1.didWin = true
            player1.totalWins += 1
            
            player2.didWin = false
            player2.totalLosses += 1
            
            results.append(player1)
            results.append(player2)
        }

        // check if this is right after the first round
        // get the wins and losses
    }
    
    func beginNextRound() {
        // check who won last round
        print("\n")
        print("-------------------- Round " + String(currentRound + 1) + " --------------------\n")

        
        var playersWithSameResults: [Player] = []
        
        //print(currentRound)
        for index in 0...currentRound {
            for player in results {
                if player.totalWins == index {
                    //print("GGGGGGG", player.name, player.totalWins, "\n")
                    playersWithSameResults.append(player)
                }
            }
            
            //print("START: ", playersWithSameResults, "\n")
            
            if (playersWithSameResults.count % 2 != 0) {
                var oddPlayer = playersWithSameResults[0]
                playersWithSameResults.remove(at: 0)
                setPairs(playerList: playersWithSameResults)
                listMatchUps()
                playersWithSameResults.removeAll()
                playersWithSameResults.append(oddPlayer)
            } else {
                setPairs(playerList: playersWithSameResults)
                listMatchUps()
            }
            
        }
        currentRound += 1
    }

}


