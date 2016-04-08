//
//  EntryController.swift
//  iosChallengeJournal
//
//  Created by admin on 4/8/16.
//  Copyright © 2016 Brock. All rights reserved.
//

import Foundation


class EntryController {
    
    static let kEntries = "entries"
    
    static var sharedController = EntryController()
    
    static var entries: [Entry] = []
    
    static func addEntry(entry: Entry) {
        entries.append(entry)
        saveToPersistentStore()
    }
    
    static func deleteEntry(entry: Entry) {
        if let entryIndex = entries.indexOf(entry) {
            entries.removeAtIndex(entryIndex)
            saveToPersistentStore()
        }
    }
    
    static func saveToPersistentStore() {
        var entryDictionaryArray: [[String:AnyObject]] = []
        for entry in entries {
            let entryDictionary = entry.dictionaryCopy
            entryDictionaryArray.append(entryDictionary)
        }
        
        NSUserDefaults.standardUserDefaults().setObject(entryDictionaryArray, forKey: kEntries)
    }
    
    static func loadFromPersistentStore() {
        if let entryDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(kEntries) as? [[String:AnyObject]] {
            var entryArray: [Entry] = []
            for entryDictionary in entryDictionaryArray {
                if let entry = Entry(dictionary: entryDictionary) {
                    entryArray.append(entry)
                }
            }
            self.entries = entryArray
        }
    }
    
}