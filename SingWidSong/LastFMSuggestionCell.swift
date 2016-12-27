//
//  LastFMSuggestionCell.swift
//  SingWidSong
//
//  Created by Shouri on 27/12/16.
//  Copyright © 2016 Shouri. All rights reserved.
//

import UIKit

class LastFMSuggestionCell : UITableViewCell{
    
    @IBOutlet var artistLabel : UILabel?
    
    func setLabel(artistName : String){
        self.artistLabel?.text = artistName
    }
    
}
