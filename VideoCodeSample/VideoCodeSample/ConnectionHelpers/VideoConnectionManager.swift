//
//  VideoConnectionManager.swift
//  VideoCodeSample
//
//  Created by Shankar Phadatare on 10/4/17.
//  Copyright © 2017 Shankar Phadatare. All rights reserved.
//

import UIKit

class VideoConnectionManager: ParentConnection {
    
    static let sharedConnectionManager = VideoConnectionManager()
    
    func getVideoSearchResults(searchString:String)
    {
        if STANDALONE {
            
            self.loadDummyData(fileName: "searchJson");
            
        }else
        {
            var urlString = kBASE_URL+"?part=snippet&q=\(searchString)&type=video&key=\(API_KEY)";
            
            urlString = urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
            
            let urlRequest = self.urlFromUrlString(urlStr: urlString, method: "Get", headerFields: nil)
            
            self.sendRequestWithUrlRequest(urlRequest: urlRequest, dataTaskDescription: REQUEST_VIDEO_SEARCH_API as NSString);
            
        }
        
    }
    
    func urlFromUrlString(urlStr:String, method:String, headerFields:NSObject?) -> URLRequest {
        
        let targetUrl = NSURL(string: urlStr)
        
        var urlRequest = URLRequest(url: targetUrl! as URL);
        
        urlRequest.httpMethod = method;
        
        if let header = headerFields {
            let headerDict = header as! NSDictionary
            for key in headerDict.allKeys
            {
                urlRequest.setValue(headerDict[key] as? String, forHTTPHeaderField: key as! String);
                
            }
        }
        
        return urlRequest
    }
    
    

}
