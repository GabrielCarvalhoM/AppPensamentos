//
//  Quote.swift
//  AppPensamentos
//
//  Created by Gabriel Carvalho on 26/09/22.
//

import UIKit

struct Quote: Codable {
    
    let quote: String
    let author: String
    let image: String
    
    var quoteFormatted: String {
        
        return "" + quote + "˜"
        
    }

    var authorFormatted: String {
        return "- " + author + " -"
    }
    
}
