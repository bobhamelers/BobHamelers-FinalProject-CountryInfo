//
//  CountryInfoController.swift
//  CountryInfo
//
//  Created by Bob Hamelers on 08/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import UIKit
import Foundation

class CountryInfoController {

    var infomations = [Information]()

    // MARK: Global Constant shared CountryInfoController
    static let shared = CountryInfoController()
    
    // MARK: Completion function to decode JSON from API with checks
    func fetchCompletion(completion: @escaping ([Information]?) -> Void) {
        let url = URL(string: "https://restcountries.eu/rest/v2/all")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data {
                do {
                    let information = try jsonDecoder.decode([Information].self, from: data)
                    self.infomations = information
                    completion(information)
//                    print(information)
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

