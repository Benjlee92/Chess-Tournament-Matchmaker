//
//  TournamentViewController.swift
//  Chess Tourney Matchup
//
//  Created by Ben Lee on 12/23/18.
//  Copyright © 2018 Ben Lee. All rights reserved.
//

import UIKit

class UnusedTournamentViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    var matchPairs: [MatchPair]? {
        didSet {
            
        }
    }
    
    let matchupCellId = "matchupCellId"
    
    
    let bgView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        v.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        v.layer.shadowOpacity = 1
        v.layer.shadowOffset = CGSize.zero
        v.layer.shadowRadius = 1.5
        return v
    }()
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Tournament"
        lbl.font = UIFont(name: "Roboto-Regular", size: 45)
        lbl.textAlignment = .left
        lbl.textColor = UIColor.TEXTCOLOR()
        return lbl
    }()
    
    lazy var tournamentCollectionView: UICollectionView = {
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        registerCells()

        view.backgroundColor = UIColor.GRAY()
        
        view.addSubview(bgView)
        bgView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 70, paddingBottom: -70, paddingRight: 70, width: 0, height: 0)
        
        bgView.addSubview(titleLabel)
        titleLabel.anchor(top: bgView.topAnchor, left: bgView.leftAnchor, bottom: nil, right: nil, paddingTop: 25, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        bgView.addSubview(tournamentCollectionView)
        tournamentCollectionView.anchor(top: titleLabel.bottomAnchor, left: bgView.leftAnchor, bottom: bgView.bottomAnchor, right: bgView.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func registerCells() {
        tournamentCollectionView.register(MatchupCell.self, forCellWithReuseIdentifier: matchupCellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tournamentCollectionView.dequeueReusableCell(withReuseIdentifier: matchupCellId, for: indexPath) as! MatchupCell
        cell.matchup = matchPairs![indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item selected")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let numberOfMatchups = matchPairs?.count as? Int else {return 0}
        
        return numberOfMatchups
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: tournamentCollectionView.frame.width, height: 130)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


