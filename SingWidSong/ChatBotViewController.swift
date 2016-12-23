//
//  ChatBotViewController.swift
//  SingWidSong
//
//  Created by Shouri on 22/12/16.
//  Copyright © 2016 Shouri. All rights reserved.
//

import UIKit
import Foundation

class ChatBotViewController : UIViewController{
    
    @IBOutlet var searchButton : UIButton?
    @IBOutlet var textField : UITextField?
    let searchString : String? = nil
    var base_url = "http://api.musixmatch.com/ws/1.1/"
    var api_key = "&apikey="
    var searchText : String?
    
    override func viewDidLoad() {
    }
    
    func getSearchText() -> String{
        searchText = textField?.text
        return searchText!
    }
    
    @IBAction func search(){
        
        let text = getSearchText()
        print(text)
        let url = base_url + "track.get?track_id=15445219" + api_key

        let request = URLRequest(url: URL(string: url)!)
        let urlSession = URLSession.shared
        let downloadTask = urlSession.downloadTask(with: request, completionHandler: {
            (data,response,error)  -> Void in
            if let error = error{
                print(error)
                return
            }
            do{
                let res = try Data(contentsOf: data!)
                self.parseJSON(data: res)
            }catch{
                print(error)
            }
        })
        downloadTask.resume()
    }
    
    func parseJSON(data : Data){
        do{
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
            let jsonMessage = jsonResult["message"] as! [String:Any]
            let jsonBody = jsonMessage["body"]
            print(jsonBody)
            
        }catch{
            print(error)
        }
    }
}
