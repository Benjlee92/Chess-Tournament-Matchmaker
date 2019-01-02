//
//  HomeViewController.swift
//  Chess Tourney Matchup
//
//  Created by Ben Lee on 1/1/19.
//  Copyright © 2019 Ben Lee. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, CreateTournamentOptionsDelegate {
    
    let homeCollectionViewCellId = "homeCollectionViewCellId"
    let createTournamentCollectionViewCellId = "createTournamentCollectionViewCellId"
    
    let navBar: UINavigationBar = {
        let nav = UINavigationBar()
        nav.prefersLargeTitles = true
        let navItem = UINavigationItem(title: "Home");
        let font = UIFont(name: "Roboto-Regular", size: 40)
        nav.titleTextAttributes = [NSAttributedStringKey.font : font, NSAttributedStringKey.foregroundColor : UIColor.TEXTCOLOR()]

        nav.setItems([navItem], animated: false)

        return nav
    }()
    
    lazy var homeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = true
        // cv.layer.shadowRadius = 40
        cv.backgroundColor = .clear
        return cv
    }()
    
    let overlay: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.black
        v.alpha = 0.5
        return v
    }()
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

        // Do any additional setup after loading the view.
    }
    
   
    fileprivate func setupUI() {
        view.backgroundColor = UIColor.GRAY()
        
        view.addSubview(navBar)
        navBar.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)

        navBar.prefersLargeTitles = true
        view.addSubview(homeCollectionView)
        homeCollectionView.anchor(top: navBar.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(overlay)
        overlay.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        overlay.isHidden = true
        
        registerCells()
        
    }
    
    func hideOverlay() {
        UIView.animate(withDuration: 0.35, animations: {
            self.overlay.alpha = 0
        }) { (true) in
            self.overlay.isHidden = true
        }
    }
    
    func showOverlay() {
        self.overlay.isHidden = false
        UIView.animate(withDuration: 0.35, animations: {
            self.overlay.alpha = 0.5
        }) { (true) in
            self.overlay.isHidden = false
        }
    }
    
    
    
    fileprivate func registerCells() {
        homeCollectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: homeCollectionViewCellId)
        homeCollectionView.register(CreateTournamentCollectionViewCell.self, forCellWithReuseIdentifier: createTournamentCollectionViewCellId)

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.item {
        case 0:
            let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: createTournamentCollectionViewCellId, for: indexPath) as! CreateTournamentCollectionViewCell
            return cell

        default:
            let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: homeCollectionViewCellId, for: indexPath) as! HomeCollectionViewCell
            return cell
 
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let padding: CGFloat =  50
        let collectionViewSize = homeCollectionView.frame.size.width - 40
//
//        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
        
        return CGSize(width: collectionViewSize, height: collectionViewSize/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let createTournamentOptionsViewController = CreateTournamentOptionsViewController()
        createTournamentOptionsViewController.modalPresentationStyle = .overCurrentContext
        createTournamentOptionsViewController.delegate = self
        switch indexPath.item {
        case 0:
            showOverlay()
            present(createTournamentOptionsViewController, animated: true, completion: nil)
            break
        default:
           break
            
        }
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
