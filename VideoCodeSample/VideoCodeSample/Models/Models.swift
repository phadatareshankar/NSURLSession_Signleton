//
//  Models.swift
//  VideoCodeSample
//
//  Created by Shankar Phadatare on 10/4/17.
//  Copyright © 2017 Shankar Phadatare. All rights reserved.
//

import Foundation

// MARK: Parsing JSON to Object for Search API

public struct PageInfo: Decodable {
    let totalResults: Int
    let resultsPerPage: Int
}

public struct itemVideo: Decodable {
    let kind: String
    let id: idObject
    let snippet:Snippet
}

public struct idObject: Decodable {
    let kind: String
    let videoId: String
}


public struct Snippet: Decodable {
    let title: String
}
public struct VideoData: Decodable {
    let kind: String
    let nextPageToken: String
    let pageInfo: PageInfo
    let items: [itemVideo]
    
}
