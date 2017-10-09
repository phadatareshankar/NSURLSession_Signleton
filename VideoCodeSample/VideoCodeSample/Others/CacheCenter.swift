//
//  CacheCenter.swift
//  VideoCodeSample
//
//  Created by Shankar Phadatare on 10/4/17.
//  Copyright © 2017 Shankar Phadatare. All rights reserved.
//

import UIKit

class CacheCenter: NSObject {
    
    static let sharedInstance = CacheCenter()
    
    var cacheStore = [String: String]()
    
    func storeCache(key:String,value:String) {
        
        cacheStore[key] = value;
        
    }
    
    func removeCache(key:String,value:String) -> Bool {
        
        cacheStore.removeValue(forKey: key);
        
        return true
    }
    
    func getCache(key:String) -> String {
        
        return cacheStore[key]!
    }
    
    
    func clearCache(key:String,value:String) -> Bool {
        
        cacheStore.removeAll()
        
        return true
    }
    

}
