//
//  SearchModel.swift
//  WikipediaDemo
//
//  Created by Agarwal, JitendraKumar on 6/24/18.
//  Copyright © 2018 Agarwal, JitendraKumar. All rights reserved.
//

import Foundation
import ObjectMapper
class SearchModel: Mappable {
    
   var pages: [Pages]?
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        pages <- map["pages"]
   
    }
    
}


class Pages: Mappable {
    var pageid: Int?
    var title: String?
    var thumbnail: ThumbnailImage?
    var terms: Terms?
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
         title <- map["title"]
        pageid <- map["pageid"]
        thumbnail <- map["thumbnail"]
        terms <- map["terms"]
    }
}


class ThumbnailImage : Mappable  {

    var imgURL: String?
    required init?(map: Map) {

    }
    func mapping(map: Map) {
       imgURL <- map["source"]
    }

}

class Terms : Mappable  {
 
    var desItems: [String]?
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        desItems <- map["description"]
    }
}

