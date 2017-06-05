//
//  APIManager.swift
//  translade
//
//  Created by Mauricio Rojas Vindas on 1/6/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {
    class func getLanguages(){
        Alamofire.request("\(Constants.API_URL)languages", method: .get, parameters: nil, encoding: URLEncoding.default, headers: [Constants.API_HEADER_HEY: Constants.API_KEY]).responseJSON {
            (response) in
            switch response.result{
            case .success:
                if let dictionary = response.result.value as? [String: AnyObject] {
                    createLanguagesAvailableAnswer(dictionary: dictionary[Constants.LENGUAGE_KEY] as! [String: AnyObject])
                }
                //print("Sirvio")
                break
            case .failure(let error):
                print("ERROR \(error)")
                break
            }
        }
    }
    
    class func createLanguagesAvailableAnswer(dictionary : [String: AnyObject])
    {
        //print(dictionary)
        var languagesArray = [[String: String]]()
        for (key, value) in dictionary {
            if let value = value as? String{
                let distionaryWithNewFormat = [Constants.DIRS_KEY: key, Constants.LENGUAGE_KEY: value]
                languagesArray.append(distionaryWithNewFormat)
            }
            else{
                sendErrorNotification()
                return
            }
        }
        let result = [Constants.LENGUAGE_KEY: languagesArray]
        NotificationCenter.default.post(name: Notification.Name(Constants.GET_LENGUAGES_NOTIFICATION), object: nil, userInfo: result)
    }
    class func sendErrorNotification(){
        NotificationCenter.default.post(name: Notification.Name(Constants.ERROR_FOUND_NOTIFICATION), object: nil)
    }
}
