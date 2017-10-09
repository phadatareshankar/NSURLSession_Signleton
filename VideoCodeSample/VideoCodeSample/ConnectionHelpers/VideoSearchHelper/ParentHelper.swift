//
//  ParentHelper.swift
//  VideoCodeSample
//
//  Created by Meenakshi Phadatare on 10/8/17.
//  Copyright © 2017 Shankar Phadatare. All rights reserved.
//

import UIKit

class ParentHelper: NSObject {
    
    var delegate:VideoSearchDelegate?
    
    func parseDataToObject(data:NSData, dataTaskName:String) {
        
        if dataTaskName == REQUEST_VIDEO_SEARCH_API
        {
            do{
                let parsedObject = try JSONDecoder().decode(VideoData.self, from: data as Data)
                if let delegate = self.delegate
                {
                    delegate.didReceiveResponseObject(videoData: parsedObject as VideoData);
                }
                
            }catch{
                
                delegate?.didRecievedError(errorMsg: error.localizedDescription)
            }
            
        }
    }

}
