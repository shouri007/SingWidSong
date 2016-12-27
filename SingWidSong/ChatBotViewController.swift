//
//  ChatBotViewController.swift
//  SingWidSong
//
//  Created by Shouri on 22/12/16.
//  Copyright © 2016 Shouri. All rights reserved.
//

import UIKit
import Foundation

protocol ChatBotDelegate{
    func setNumberOfRows(rows : Int)
}

class ChatBotViewController : UIViewController{
    
    //declarations
    @IBOutlet var searchButton : UIButton?
    @IBOutlet var textField : UITextField?
    let searchString : String? = nil
    var musix_base_url = "http://api.musixmatch.com/ws/1.1/"
    let musix_api_key = "&apikey=bac80b7f06af437edc250ebe533c6b5c"
    var lastfm_base_url = "http://ws.audioscrobbler.com/2.0/"
    let lastfm_api_key = "&api_key=f49465598c43e3f270feebb55ce289d3&format=json"
    var num_suggestions = 0
    var searchText : String?
    var suggestions : [LastFmSuggestion] = []
    
    //function implementations
    func getSearchText() -> String{
        searchText = textField?.text
        return searchText!
    }
    
    //results are returned by calling the api functions based on user input
    @IBAction func search(){
        
        let text = getSearchText()
        let api_method = "?method=track.search&track=closer"
        let url = lastfm_base_url + api_method + lastfm_api_key
        retrieveData(url: url)
    }
    
    func retrieveData(url : String){
        
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
                self.parseJSONforLastFM(data: res)
            }catch{
                print(error)
            }
        })
        downloadTask.resume()
    }
    
    //parses json data for results returned by the LastFM api.
    func parseJSONforLastFM(data : Data){
        
        do{
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
            let jsonMessage = jsonResult["results"] as? [String:Any]
            let jsonBody = jsonMessage!["trackmatches"] as? [String:Any]
            let results = jsonBody!["track"] as? NSArray
            num_suggestions = (results?.count)!
            var i = 0
            while i < (results?.count)!{
                var suggestion = results?[i] as? [String:Any]
                let artist = suggestion!["artist"] as? String
                let name = suggestion!["name"] as? String
                let sug = LastFmSuggestion(artist: artist!, name: name!)
                suggestions.append(sug)
                i = i + 1
            }
            present(LastFmSuggestionsViewController(num_suggestions,suggestions), animated: true, completion: nil)
        }catch{
            print(error)
        }
    }
}
