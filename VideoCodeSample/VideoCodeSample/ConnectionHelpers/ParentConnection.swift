//
//  ParentConnection.swift
//  VideoCodeSample
//
//  Created by Meenakshi Phadatare on 10/8/17.
//  Copyright © 2017 Shankar Phadatare. All rights reserved.
//

import UIKit

class ParentConnection: NSObject {
    
    var session : URLSession?
    
    var delegate:VideoCodeDelegate?
    
    //#MARK: Dummy Data Load Methods
    
    func loadDummyData(fileName:String) {
        
        var data: NSData?
        var taskName:String?
        
        do {
            if let file = Bundle.main.url(forResource: fileName, withExtension: "json") {
                data = try Data(contentsOf: file) as NSData
                
            } else {
                print("no file")
                if let delegate = self.delegate {
                    delegate.didRecievedError(errorMsg: "No file Found")
                }
                return
            }
        } catch {
            print(error.localizedDescription)
        }
        
        if fileName == "searchJson" {
            taskName = REQUEST_VIDEO_SEARCH_API
        }
        
        if let delegate = self.delegate, let jsonData = data {
            
            delegate.didRecievedSuccessResponseWithData(data: jsonData, taskDescription: taskName!)
            
        }else {
            delegate?.didRecievedError(errorMsg: "Data and delegate handling error");
        }
        
    }
    
    
    //#MARK: Request Methods
    
    func sendRequestWithUrlRequest(urlRequest:URLRequest, dataTaskDescription:NSString)  {
        
        let config = URLSessionConfiguration.default
        
        session  = URLSession(configuration: config);
        
        let sessionDataTask = session?.dataTask(with: urlRequest) { (data, response, error) in
            
            if let error =  error {
                if let delegate = self.delegate{
                    
                    delegate.didRecievedError(errorMsg: error.localizedDescription)
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse{
                
                if httpResponse.statusCode != 200{
                    if let delegate = self.delegate{
                        
                        delegate.didRecievedError(errorMsg: TECHNICAL_ERROR_MSG)
                    }
                    return
                    
                }else {
                    if data != nil {
                        
                        if let delegate = self.delegate{
                            let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                            print("Response data \(dataString! as String)");
                            delegate.didRecievedSuccessResponseWithData(data: data as AnyObject, taskDescription: dataTaskDescription as String)
                        }
                        
                    }
                }
            }else {
                
                if let delegate = self.delegate{
                    
                    delegate.didRecievedError(errorMsg: TECHNICAL_ERROR_MSG)
                }
            }
            
        }
        sessionDataTask?.resume();
    }

}
