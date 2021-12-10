//
//  Contact.swift
//  ContactsApp
//
//  Created by Fernando Pérez Ruiz on 08/12/21.
//

import Foundation
import RealmSwift

//Our Contact Model
class Contact : Object {
    @objc dynamic var name : String = ""
    @objc dynamic var lastName : String = ""
    @objc dynamic var secondLastName : String = ""
    @objc dynamic var email : String = ""
    @objc dynamic var phoneNumber : String = ""
}
