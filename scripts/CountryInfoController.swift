//
//  CountryInfoController.swift
//  CountryInfo
//
//  This Controller calls information from a JSON API.
//  The information is stored in var informations and consists of Information Struct (Informations.swift).
//  Every controller can call this global var informations.
//  The fetchCompletion function is called in CountriesTableViewController.
//
//  Created by Bob Hamelers on 08/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import UIKit
import Foundation

class CountryInfoController {

    func completion(completion: @escaping ([Information]?) -> Void) {
        let url = URL(string: "https://restcountries.eu/rest/v2/all")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data {
                do {
                    let information = try jsonDecoder.decode([Information].self, from: data)
                    completion(information)
                    print(information)
                } catch {
                    print(error)
                }
            } else {
                completion(nil)
            return
            }
        }
        task.resume()
    }
}

