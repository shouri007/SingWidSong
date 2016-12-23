//
//  ChatBotViewController.swift
//  SingWidSong
//
//  Created by Shouri on 22/12/16.
//  Copyright © 2016 Shouri. All rights reserved.
//

import UIKit

class ChatBotViewController : UIViewController{
    
    @IBOutlet var searchButton : UIButton?
    @IBOutlet var textField : UITextField?
    let searchString : String? = nil
    var base_url = "http://api.musixmatch.com/ws/1.1/"
    var api_key = "bac80b7f06af437edc250ebe533c6b5c"
    
    
    override func viewDidLoad() {
    }
    
    @IBAction func search(){
        
        
    }

}
