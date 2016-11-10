//
//  MessagesViewController.swift
//  Chat-Storyboard
//
//  Created by Dante Solorio on 10/11/16.
//  Copyright © 2016 iOS School Mexico. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var messagesTableView: UITableView!
    
    let messageCellId = "messageCellId"
    
    var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getExampleData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - General functions
    fileprivate func getExampleData(){
        let message1 = Message()
        message1.messageText = "Hi"
        message1.messageUserId = 1
        
        let message2 = Message()
        message2.messageText = "Hello"
        message2.messageUserId = 2
        
        let message3 = Message()
        message3.messageText = "How are you?"
        message3.messageUserId = 1
        
        let message4 = Message()
        message4.messageText = "Fine, how about you?"
        message4.messageUserId = 2
        
        messages += [message1, message2, message3, message4]
    }
    
    // MARK: - Table delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = messagesTableView.dequeueReusableCell(withIdentifier: messageCellId, for: indexPath) as! MessageTableViewCell
        
        let message = messages[indexPath.row]
        
        // Message text
        cell.messageLabel.text = message.messageText
        // Message user
        if message.messageUserId == 1{
            cell.messageLabel.textAlignment = .right
            cell.backgroundColor = .blue
            cell.messageLabel.textColor = .white
        }
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
