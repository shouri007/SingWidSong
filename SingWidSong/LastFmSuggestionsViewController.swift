//
//  LastFmSuggestionsViewController.swift
//  SingWidSong
//
//  Created by Shouri on 24/12/16.
//  Copyright © 2016 Shouri. All rights reserved.
//

import UIKit

protocol LastFmSuggestionViewControllerDelegate {
    
    var num_rows : Int {get set}
    func setNumberOfRows()
}

class LastFmSuggestionsViewController : UITableViewController{
    
    var num_rows = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 80
    }
    
    init(count : Int){
        super.init(style: .grouped)
        self.num_rows = count
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return num_rows
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}
