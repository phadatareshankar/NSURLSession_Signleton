//
//  VideoSearchHelper.swift
//  VideoCodeSample
//
//  Created by Shankar Phadatare on 10/4/17.
//  Copyright © 2017 Shankar Phadatare. All rights reserved.
//

import UIKit

class VideoSearchHelper: ParentHelper {
    
    static let sharedInstance = VideoSearchHelper()
    
    let videoConnection = VideoConnectionManager.sharedConnectionManager;
    
    
    func getVideoSearchResult(searchStr:NSString) {
        videoConnection.delegate = self as VideoCodeDelegate
        videoConnection.getVideoSearchResults(searchString: searchStr as String);
    }
    
}

extension VideoSearchHelper: VideoCodeDelegate
{
    func didRecievedSuccessResponseWithData(data: AnyObject, taskDescription: String) {
        self.parseDataToObject(data: data as! NSData, dataTaskName: taskDescription)
    }
    
    func didRecievedError(errorMsg:String){
        
        if let delegateObj = self.delegate{
            
            delegateObj.didRecievedError(errorMsg: errorMsg)
        }
    }
    
}
