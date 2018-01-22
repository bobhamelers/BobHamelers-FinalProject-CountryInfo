/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

// MARK: JSON into struct
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
    let area : Double?
//    let gini : Double?
    let timezones : [String]?
    let borders : [String]?
//    let nativeName : String?
    let numericCode : String?
    let currencies : [Currencies]?
    let languages : [Languages]?
    let translations : Translations?
//    let flag : String?
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
struct Translations : Codable {
    let de : String?
    let es : String?
    let fr : String?
    let ja : String?
    let it : String?
    let br : String?
    let pt : String?
    let nl : String?
    let hr : String?
    let fa : String?
}

struct RegionalBlocs : Codable {
    let acronym : String?
    let name : String?
    let otherAcronyms : [String]?
    let otherNames : [String]?
}

struct Results : Codable {
    
    let results : [Information]
    // JSON results dictionary
}

