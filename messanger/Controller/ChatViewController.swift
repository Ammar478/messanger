//
//  ChatViewController.swift
//  messanger
//
//  Created by Ammar Ahmed on 10/06/1445 AH.
//

import UIKit
import MessageKit

class ChatViewController: MessagesViewController {

    private var messages=[Message]()
    
    private let selfSender = Sender(photoURL: "",
                                   senderId: "1",
                                   displayName: "Ammar Ahmed")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .white
        
        messages.append(Message(sender: selfSender, messageId: "1", sentDate: Date(), kind: .text("Hello world")))
        messages.append(Message(sender: selfSender, messageId: "12", sentDate: Date(), kind: .text("Hello world Yasser")))

        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.messagesLayoutDelegate = self

        
    }
    

    



}

extension ChatViewController:MessagesDataSource,MessagesLayoutDelegate,MessagesDisplayDelegate{
    func currentSender() -> MessageKit.SenderType {
        return selfSender
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageKit.MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return messages.count
    }
}

struct Message:MessageType{
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

struct Sender:SenderType{
    var photoURL:String
    var senderId: String
    var displayName: String
}
