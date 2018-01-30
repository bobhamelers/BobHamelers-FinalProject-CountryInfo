//
//  Information.swift
//  CountryInfo
//
//  Information struct definition, used in CountryInfoController, CountriesTableViewController, CountryTableViewController, ListsTableViewController, ListTableViewController, ListFeederTableViewController and ListChangerTableViewController.
//  Is used for get data information from JSON API from https://restcountries.eu/rest/v2/all (https://restcountries.eu) .
//  Some lines are intentional outcommented so developers can use this swift file in the future.
//  This file is generated with help of https://json4swift.com
//
//  Created by Bob Hamelers on 19/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import Foundation

// MARK: JSON into struct.
struct Information : Codable {
	let name : String?
    let topLevelDomain : [String]?
    let alpha2Code : String?
    let alpha3Code : String?
    let callingCodes : [String]?
    let capital : String?
//    let altSpellings : [String]?
    let region : String?
    let subregion : String?
    let population : Int?
//    let latlng : [Int]?
    let demonym : String?
//    let area : Double?
//    let gini : Double?
    let timezones : [String]?
    let borders : [String]?
//    let nativeName : String?
    let numericCode : String?
    let currencies : [Currencies]?
    let languages : [Languages]?
//    let translations : Translations?
    let flag : String?
    let regionalBlocs : [RegionalBlocs]?
//    let cioc : String?
}

struct Currencies : Codable {
    let code : String?
    let name : String?
    let symbol : String?
}

struct Languages : Codable {
    let iso639_1 : String?
    let iso639_2 : String?
    let name : String?
    let nativeName : String?
}
//struct Translations : Codable {
//    let de : String?
//    let es : String?
//    let fr : String?
//    let ja : String?
//    let it : String?
//    let br : String?
//    let pt : String?
//    let nl : String?
//    let hr : String?
//    let fa : String?
//}

struct RegionalBlocs : Codable {
    let acronym : String?
    let name : String?
    let otherAcronyms : [String]?
    let otherNames : [String]?
}

