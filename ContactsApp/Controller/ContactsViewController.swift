//
//  ContactsViewController.swift
//  ContactsApp
//
//  Created by Fernando Pérez Ruiz on 08/12/21.
//

import UIKit
import RealmSwift

class ContactsViewController: UIViewController {

    @IBOutlet weak var contactsTableView: UITableView!
    
    let realm = try! Realm()
    var contactList : Results<Contact>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set delegate as our self
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //load contacts from realm
        loadContacts()
        contactsTableView.reloadData()
        registerCell()
    }
    
    private func loadContacts(){
        contactList = realm.objects(Contact.self)
    }
    
    //Register our customViewCell
    private func registerCell(){
        contactsTableView.register(UINib(nibName: "EmptyContactTableViewCell", bundle: nil), forCellReuseIdentifier: "emptyCell")
    }
    
}

//MARK: - TableView Methods

extension ContactsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let safeContacts = contactList {
            if safeContacts.count < 1 {
                return 1
            }
        }
        return contactList?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell") as! ContactTableViewCell
        let emptyCell = tableView.dequeueReusableCell(withIdentifier: "emptyCell") as! EmptyContactTableViewCell

        //Set our cells, according to our contactList
        if let safeContactList = contactList {
            if safeContactList.count < 1 {
                tableView.rowHeight = 130
                emptyCell.setupEmptyCell()
                return emptyCell
            } else {
                cell.setupCell(with: safeContactList[indexPath.row])
            }
        }
        
        return cell
    }
}
