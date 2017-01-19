//
//  URNBuilder.swift
//  viper
//
//  Created by Sergii Avilov on 1/19/17.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation

struct URNBuilder {
    
    let urn: String
    
    init(string: String) {
        urn = string
    }
    
    func buildWithArgs(args: Array<String>) -> String {
        let components = urn.components(separatedBy: ":")
        
        var indx = 0
        var result = ""
        
        for part in components {
            if !result.isEmpty {
                result += ":"
            }
            if part.hasPrefix("{") && indx < args.count {
                result += args[indx]
                indx += 1
            } else {
                
                result += part
            }
        }
        
        return result
    }
}
