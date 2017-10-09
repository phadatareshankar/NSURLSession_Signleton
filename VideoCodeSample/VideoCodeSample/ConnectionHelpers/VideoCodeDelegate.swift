//
//  VideoCodeDelegate.swift
//  VideoCodeSample
//
//  Created by Shankar Phadatare on 10/4/17.
//  Copyright © 2017 Shankar Phadatare. All rights reserved.
//

import UIKit

//#MARK: Connection Protocols

protocol VideoCodeDelegate {
    
    func didRecievedError(errorMsg:String);
    
    func didRecievedSuccessResponseWithData(data:AnyObject, taskDescription:String);
    
}

//#MARK: Helper Protocols
protocol ConnectionHelperDelegate {
    
    func didRecievedError(errorMsg:String);
    
}

protocol VideoSearchDelegate: ConnectionHelperDelegate {
    
    func didRecievedError(errorMsg:String);
    
    func didReceiveResponseObject(videoData:VideoData)
    
}
