//
//  Entry.swift
//  iosChallengeJournal
//
//  Created by admin on 4/8/16.
//  Copyright © 2016 Brock. All rights reserved.
//

import UIKit


class Entry: Equatable {
    
    let kTitle = "title"
    let kBody = "body"
    let kTimestamp = "timestamp"
    
    var title: String
    var body: String
    var timestamp: NSDate
    
    init(title: String, body: String, timestamp: NSDate = NSDate()) {
        self.title = title
        self.body = body
        self.timestamp = timestamp
    }
    
    var dictionaryCopy: [String:AnyObject] {
        let dictionary: [String:AnyObject] = [kTitle:title, kBody:body, kTimestamp:timestamp]
        return dictionary
    }
    
    init?(dictionary: [String:AnyObject]) {
        guard let title = dictionary[kTitle] as? String,
                  body = dictionary[kBody] as? String,
                  timestamp = dictionary[kTimestamp] as? NSDate else {return nil}
        self.title = title
        self.body = body
        self.timestamp = timestamp
    }
    
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return lhs.title == rhs.title && lhs.body == rhs.body && lhs.timestamp == rhs.timestamp
}