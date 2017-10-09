//
//  Constants.swift
//  VideoCodeSample
//
//  Created by Shankar Phadatare on 10/4/17.
//  Copyright © 2017 Shankar Phadatare. All rights reserved.
//

import UIKit


//#MARK: Constants variables

let kBASE_URL = "https://www.googleapis.com/youtube/v3/search";
let API_KEY = "AIzaSyBIbFDeeko3SOYflejSXSHm_MFzIWkDwcY";
let REQUEST_VIDEO_SEARCH_API = "VideoSearchAPI";
let TECHNICAL_ERROR_MSG = "Facing technical issue, Please try again later";
let TECHNICAL_ERROR_TITLE = "Technical Error"
let SIGN_OUT_MSG = "Are you sure to SignOut?"


//#MARK: Schema variables

#if Debug
    
    let STANDALONE = false
    
#elseif QA1
    
    let STANDALONE = false
    
#elseif RELEASE
    
    let STANDALONE = false
    
#elseif QA2
    
    let STANDALONE = false

#else
   
#endif






