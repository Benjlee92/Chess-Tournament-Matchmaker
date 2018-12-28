//
//  TournViewController.swift
//  Chess Tourney Matchup
//
//  Created by Ben Lee on 12/23/18.
//  Copyright © 2018 Ben Lee. All rights reserved.
//

import UIKit

class TournamentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var matchPairs: [MatchPair]? {
        didSet {
            
        }
    }
    
    let tableViewCellId =  "CellId"
    
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
        lbl.font = UIFont(name: "Roboto-Regular", size: 45)
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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        registerCells()
        
        view.backgroundColor = UIColor.GRAY()
        
        view.addSubview(bgView)
        bgView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 50, paddingBottom: -70, paddingRight: 50, width: 0, height: 0)
      
        bgView.addSubview(titleLabel)
        titleLabel.anchor(top: bgView.topAnchor, left: bgView.leftAnchor, bottom: nil, right: nil, paddingTop: 25, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        bgView.addSubview(tableView)
        tableView.anchor(top: titleLabel.bottomAnchor, left: bgView.leftAnchor, bottom: bgView.bottomAnchor, right: bgView.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)

       
    }
    
    func registerCells() {
        //tableView.register(UITableViewCell.self, forCellWithReuseIdentifier: tableViewCellId)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: tableViewCellId)
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId, for: indexPath) as! UITableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let test = UIContextualAction(style: .normal, title: "Test") { (_, _, true) in
            print("Test pressed")
        }
        
        return UISwipeActionsConfiguration(actions: [ test])

    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let test = UIContextualAction(style: .normal, title: "Test") { (_, _, true) in
            print("Test pressed")
        }
        
        //let t = UIContextualAction(style: .normal, title: "<#T##String?#>", handler: <#T##UIContextualActionHandler##UIContextualActionHandler##(UIContextualAction, UIView, (Bool) -> Void) -> Void#>)
        return UISwipeActionsConfiguration(actions: [ test])

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
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
