//
//  LastFmSuggestionsViewController.swift
//  SingWidSong
//
//  Created by Shouri on 24/12/16.
//  Copyright © 2016 Shouri. All rights reserved.
//

import UIKit

class LastFmSuggestionsViewController :UITableViewController{
    
    var num_rows = 0
    var suggestions : [LastFmSuggestion] = []
    
    init(_ rows : Int, _ sug : [LastFmSuggestion]){
        super.init(style: .grouped)
        self.num_rows = rows
        self.suggestions = sug
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 80
        let lfmcellNib = UINib(nibName: "LastFMSuggestionCell", bundle: nil)
        
        self.tableView.register(lfmcellNib, forCellReuseIdentifier: "LastFmCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return num_rows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "LastFmCell") as! LastFMSuggestionCell
        cell.setLabel(artistName: suggestions[indexPath.row].artist!)
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
}
