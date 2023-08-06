//
//  ChatViewController.swift
//  FlashChat-IOS13-Angela
//
//  Created by Павел Грицков on 14.03.23.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLogOutBarButtonItem()
        setupTableView()
        loadMessage()
        // TODO: в поле messageTextField не вводятся текст на ру языке
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // скрыть кнопку назад
        navigationItem.hidesBackButton = true
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: K.BrandColors.purple)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    /// загружает данные с сообщениями из базы
    func loadMessage() {
        // order - позволяет упорядочить данные
        // addSnapshotListener - слушатель который реагирует на изменения данных в базе
        
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { querySnapshot, error in
                
            self.messages = []
                
            if let error {
                print(error.localizedDescription)
                return
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for document in snapshotDocuments {
                        let data = document.data()
                        
                        if let messageSender = data[K.FStore.senderField] as? String,
                           let messageBody = data[K.FStore.bodyField] as? String {
                            
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                // скролл таблици к последней ячейке
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        if let messageBody = messageTextField.text,
           let messageSender = Auth.auth().currentUser?.email {
            
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField : messageSender,
                K.FStore.bodyField : messageBody,
                K.FStore.dateField : Date().timeIntervalSince1970]) { error in
                    if let error {
                        print(error.localizedDescription)
                    } else {
                        DispatchQueue.main.async {
                            self.messageTextField.text = ""
                        }
                    }
            }
        }
    }
}

private extension ChatViewController {
    func createLogOutBarButtonItem() {
        // TODO: перекрасить кнопку в белый
        let logOutBarButtonItem = UIBarButtonItem(title: "Log Out", style: .done, target: self, action: #selector(logOutPressed))
        navigationItem.rightBarButtonItem = logOutBarButtonItem
    }
    
    func setupTableView() {
        tableView.dataSource = self
        let cellNib = UINib(nibName: K.cellNibName, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: K.cellIdentifier)
    }
}

@objc extension ChatViewController {
    func logOutPressed() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageViewCell
        
        let message = messages[indexPath.row]
        let textBody = message.body
        // проверка соответствует ли сообщение сообщению пользователя
        if message.sender == Auth.auth().currentUser?.email {
            cell.configure(text: textBody, IsCurrentUser: true)
        } else {
            cell.configure(text: textBody, IsCurrentUser: false)
        }
        
        return cell
    }
}
