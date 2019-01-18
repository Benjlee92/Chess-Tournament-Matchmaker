//
//  TournViewController.swift
//  Chess Tourney Matchup
//
//  Created by Ben Lee on 12/23/18.
//  Copyright © 2018 Ben Lee. All rights reserved.
//

import UIKit


class TournamentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var currentRound = 1
    var numberOfRounds = 0
    
    var playersList: [Player] = []
    var playersListWithSameWins: [Player] = []
    
    var allMatchPairs: [MatchPair] = []
    var allMatchPairsHolder: [MatchPair] = []
    
    var results: [Player] = []
    var resultsHolder: [Player] = []
    
    var roundWinners: [Player] = []
    var roundLosers: [Player] = []
    
    var playersWithSameWins: [Player] = []
    var matchPairs: [MatchPair] = []
    
    var numberOfMatchPairs: Int = 0
    let tableViewCellId =  "CellId"
    
    var allMatchupsComplete: Bool =  false
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .white
        tv.alwaysBounceVertical = false
        tv.separatorStyle = .none
        return tv
    }()
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Tournament"
        lbl.font = UIFont(name: "Roboto-Regular", size: 22)
        lbl.textAlignment = .left
        lbl.textColor = UIColor.TEXTCOLOR()
        return lbl
    }()
    
    let roundLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Round: 1"
        lbl.font = UIFont(name: "Roboto-Regular", size: 22)
        lbl.textAlignment = .left
        lbl.textColor = UIColor.TEXTCOLOR()
        return lbl
    }()
    
    let bgView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        v.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        v.layer.shadowOpacity = 1
        v.layer.shadowOffset = CGSize.zero
        v.layer.shadowRadius = 1.5
        return v
    }()
    
    let nextRoundButton: UIButton  = {
        let button = UIButton(type: .system)
        button.setTitle("Next Round", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 43, green: 203, blue: 151)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 12)
        button.layer.shadowColor = UIColor.SHADOWCOLOR202().cgColor
        button.layer.shadowOffset = CGSize.zero
        button.layer.shadowRadius = 1.5
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(toNextRound), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.GRAY()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUI()
    }
    
    func setupUI() {
        registerCells()
        
        view.backgroundColor = UIColor.GRAY()
        
        view.addSubview(bgView)
        bgView.anchor(top: navigationController?.navigationBar.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
      
        bgView.addSubview(titleLabel)
        titleLabel.anchor(top: bgView.topAnchor, left: bgView.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        bgView.addSubview(roundLabel)
        roundLabel.anchor(top: titleLabel.bottomAnchor, left: titleLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 180, height: 0)
        
        bgView.addSubview(tableView)
        tableView.anchor(top: roundLabel.bottomAnchor, left: bgView.leftAnchor, bottom: bgView.bottomAnchor, right: bgView.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(nextRoundButton)
        nextRoundButton.anchor(top: bgView.topAnchor, left: nil, bottom: nil, right: bgView.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingBottom: 0,  paddingRight: 0, width: 150, height: 45)
        //nextRoundButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        updateRoundLabel()
    }
    
    func registerCells() {
        tableView.register(MatchupTableViewCell.self, forCellReuseIdentifier: tableViewCellId)
    }
    
    func updateRoundLabel() {
        roundLabel.text = "Round: \(currentRound) / \(numberOfMatchPairs)"
    }
    
    @objc func toNextRound() {
        setScores()
        setResults()
        setPlayersWithSameWins()
        
        currentRound += 1

    }
    
//
//    @objc func toNextRound() {
//
//
//
//        //print("NextRoundPressed")
//        //print("PlayersList: \(playersList)")
//        //setResults()
//
//        currentRound += 1
//        //startNextRound()
//
////       // beginNextRound()
////        updateRoundLabel()
////        nextRoundButton.isEnabled = false
////        tableView.reloadData()
//    }
//
    
    func setPlayersWithSameWins() {

        for index in 0...currentRound {
            
        }
    }
    
    func setResults() {
        results.removeAll()
        for pair in matchPairs {
            let player1 = pair.player1
            let player2 = pair.player2
            results.append(player1)
            results.append(player2)
        }
        matchPairs.removeAll()
        
        for result in results {
            print("result: \(result.name) wins: \(result.totalWins)")
        }
    }


    
    func checkIfAllMatchupsCompleted() {
        var counter = 0
        for pair in matchPairs {
            if pair.matchComplete == true {
                counter += 1
            }
        }
        if counter == numberOfMatchPairs {
            allMatchupsComplete = true
            nextRoundButton.isEnabled = true
        }
    }

    func updateBlackPlayerResults(index: Int) {
        // Player1 is always the white player

        if self.matchPairs[index].matchComplete == false {
            self.matchPairs[index].matchComplete = true
            matchPairs[index].player1.totalLosses += 1
            matchPairs[index].player2.didWin = true
            matchPairs[index].player2.totalWins += 1
            checkIfAllMatchupsCompleted()
        }
        
    }
    
    func updateWhitePlayerResults(index: Int) {
        
        if self.matchPairs[index].matchComplete == false {
            self.matchPairs[index].matchComplete = true
            matchPairs[index].player1.totalWins += 1
            matchPairs[index].player1.didWin = true

            matchPairs[index].player2.totalLosses += 1
            checkIfAllMatchupsCompleted()
        }
    }
    
    func updateDraw(index: Int) {
        // Player1 is always the white player

        self.matchPairs[index].player2.totalScore += 0.5
        self.matchPairs[index].player1.totalScore += 0.5
        self.matchPairs[index].player1.didDraw = true
        self.matchPairs[index].player2.didDraw = true

        checkIfAllMatchupsCompleted()
    }
    
    func startNextRound() {
        sortPlayers()
    }
    func sortPlayers() {
        listMatchUps()
    }

    func sortPlayersT() {
        var allPlayersWithSameWins = sameWins()
        let maxPossibleWins = currentRound - 1
        var playersWithSameWins: [Player] = []
        var storage: [Player] = []
        var oddPlayer: Player?
        var playersToSetPairs: [[Player]] = [[]]
        
        for section in 0...maxPossibleWins {
            playersWithSameWins = allPlayersWithSameWins[section]
            if playersWithSameWins.count % 2 != 0 { //players at the index are odd
                if playersWithSameWins.count == 1 { // only one player
                    oddPlayer = playersWithSameWins[0]
                } else {
                    oddPlayer = playersWithSameWins[0]
                    playersToSetPairs = setForOddPlayer(allPlayersWithSameWins: allPlayersWithSameWins, sectionOfOddPlayer: section)
                    allPlayersWithSameWins = playersToSetPairs
                    playersWithSameWins = playersToSetPairs[section]
                    setPair(players: playersToSetPairs)
                    listMatchUps()
                }
            } else if playersWithSameWins.count % 2 == 0  { // even number
                setPair(players: allPlayersWithSameWins)
            }
        }
    }
    
    func setForOddPlayer(allPlayersWithSameWins: [[Player]], sectionOfOddPlayer: Int) -> [[Player]]{
        // find the current section
        var allPlayers = allPlayersWithSameWins
        var oddSection = allPlayersWithSameWins[sectionOfOddPlayer]
        var oddPlayer = oddSection[0]
        var totalSections = allPlayersWithSameWins.count
        var newSection: [Player] = []
        
        let isIndexValid = allPlayersWithSameWins.indices.contains(sectionOfOddPlayer + 1)
        if isIndexValid {
            newSection = allPlayersWithSameWins[sectionOfOddPlayer + 1]
            newSection.append(oddPlayer)
            oddSection.remove(at: 0)
            allPlayers[sectionOfOddPlayer] = oddSection
            allPlayers[sectionOfOddPlayer + 1] = newSection
        }

        return allPlayers
    }
    
    func setPair(players: [[Player]]) {
        var pairs: [MatchPair] = []

        for section in players {
            var numberOfMatchPairsInSection = (section.count / 2)
            var group = section
            
            for index in 1...numberOfMatchPairsInSection { // looping through the number of pairs
                var pair : [Player] = []
                for ind in 1...2 { // loop through twice to pick 2 people
                    let randomIndex = Int(arc4random_uniform(UInt32(group.count))) // getting a random index
                    let player = group[randomIndex]
                    pair.append(player)
                    group.remove(at: randomIndex)
                }
                var matchPair = MatchPair(player1: nil, player2: nil, players: nil, result: nil, matchComplete: nil)
                matchPair.player1 = pair[0]
                matchPair.player2 = pair[1]
                pairs.append(matchPair)
                pair.removeAll()
            }
        }
        matchPairs.append(contentsOf: pairs)
        print("pairs: count: \(pairs.count)")
        print("MatchPairs: count: \(matchPairs.count)")
    }
    
    func sameWins() -> [[Player]]  {
        var group: [[Player]] = []
        let maxPossibleWins = currentRound - 1 // need to see how we are setting current round
        
        for index in 0...maxPossibleWins {
            var playersWithSameWins: [Player] = []
            for result in results {
                if result.totalWins == index {
                    playersWithSameWins.append(result)
                }
            }
            group.insert(playersWithSameWins, at: index)
            playersWithSameWins.removeAll()
        }
        return group
    }
    
    func listMatchUps() {
        for matchPair in matchPairs {
            var player1 = matchPair.player1
            var player2 = matchPair.player2
            
            print(player1.boardColor + ": " + player1.name, "(\(String(player1.totalWins))W \(String(player1.totalLosses))L)" + "   VS   " + player2.boardColor + ": " + player2.name, "(\(String(player2.totalWins))W \(String(player2.totalLosses))L)")
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId, for: indexPath) as! MatchupTableViewCell
        cell.matchUp = matchPairs[indexPath.item]
        
        if currentRound > 1 {
            cell.hideOverlay()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        var cell = tableView.cellForRow(at: indexPath) as! MatchupTableViewCell
        
        var nameOfWinner: String = ""
        
        if self.matchPairs[indexPath.item].player1.boardColor == "Black" {
            nameOfWinner == self.matchPairs[indexPath.item].player1.name
        } else {
            nameOfWinner == self.matchPairs[indexPath.item].player2.name
        }
        
        let font = UIFont(name: "Roboto-Regular", size: 30)
        let attribute = [NSAttributedStringKey.font : font]
        let attributedName = NSMutableAttributedString(string:  "   \(nameOfWinner) Won    ", attributes: attribute)
        let attributedDraw = NSMutableAttributedString(string:  "   Draw   ", attributes: attribute)
        
        let blackWin = UIContextualAction(style: .normal, title: attributedName.string) { (_, _, true) in
            self.updateBlackPlayerResults(index: indexPath.item)
            cell.result = self.matchPairs[indexPath.item]
        }
        
        let draw = UIContextualAction(style: .normal, title: attributedDraw.string) { (_, _, true) in
            
            self.updateDraw(index: indexPath.item)
            cell.result = self.matchPairs[indexPath.item]
            
        }
        
        blackWin.backgroundColor = UIColor.BLACKCOLOR()
        draw.backgroundColor = UIColor.lightGray
        return UISwipeActionsConfiguration(actions: [blackWin, draw])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        var cell = tableView.cellForRow(at: indexPath) as! MatchupTableViewCell
        
        var nameOfWinner: String = ""
        
        if self.matchPairs[indexPath.item].player1.boardColor == "White" {
            nameOfWinner == self.matchPairs[indexPath.item].player1.name
        } else {
            nameOfWinner == self.matchPairs[indexPath.item].player2.name
        }
        
        let font = UIFont(name: "Roboto-Regular", size: 30)
        let attribute = [NSAttributedStringKey.font : font]
        let attributedName = NSMutableAttributedString(string:  "   \(nameOfWinner) Won    ", attributes: attribute)
        let attributedDraw = NSMutableAttributedString(string:  "   Draw   ", attributes: attribute)
        
        let whiteWin = UIContextualAction(style: .normal, title: attributedName.string) { (_, _, true) in
            self.updateWhitePlayerResults(index: indexPath.item)
            
            cell.result = self.matchPairs[indexPath.item]
        }
        
        let draw = UIContextualAction(style: .normal, title: attributedDraw.string) { (_, _, true) in
            self.updateDraw(index: indexPath.item)
            cell.result = self.matchPairs[indexPath.item]
        }
        
        whiteWin.backgroundColor = UIColor.rgb(red: 220, green: 220, blue: 220)
        draw.backgroundColor = UIColor.lightGray
        return UISwipeActionsConfiguration(actions: [whiteWin, draw])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //guard let number = matchPairs.count else { return 0}
        return matchPairs.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
