//
//  EntryDetailViewController.swift
//  iosChallengeJournal
//
//  Created by admin on 4/8/16.
//  Copyright © 2016 Brock. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    var entry: Entry?
    
    @IBOutlet weak var entryTextField: UITextField!
    @IBOutlet weak var detailEntryTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        EntryController.loadFromPersistentStore()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func clearSectionButtonTapped(sender: AnyObject) {
        entryTextField.text = ""
        detailEntryTextView.text = ""
    }
    
    @IBAction func saveEntryButtonTapped(sender: AnyObject) {
        if let entry = self.entry {
            entry.title = self.entryTextField.text!
            entry.body = self.detailEntryTextView.text
            entry.timestamp = NSDate()
        } else {
            let newEntry = Entry(title: self.entryTextField.text!, body: self.detailEntryTextView.text)
            EntryController.addEntry(newEntry)
            EntryController.saveToPersistentStore()
        }
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func updateEntry(entry: Entry) {
            self.entry = entry
            self.entryTextField.text = entry.title
            self.detailEntryTextView.text = entry.body
            EntryController.saveToPersistentStore()
   

        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
