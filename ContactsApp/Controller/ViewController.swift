//
//  ViewController.swift
//  ContactsApp
//
//  Created by Fernando Pérez Ruiz on 08/12/21.
//

import UIKit
import RealmSwift
import KeyboardLayoutGuide

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var secondLastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var fieldsStackView: UIStackView!
    @IBOutlet weak var addContactButton: UIButton!
    
    let realm = try! Realm()
    
    var textFields = [UITextField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Fill our textField array
        textFields = [nameTextField, lastNameTextField, secondLastNameTextField, emailTextField, phoneNumberTextField]
        
        //Setup
        setTextFieldsDelegates()
        setupLayout()
        
    }

    @IBAction func addContactTapped(_ sender: UIButton) {
        //Check if all textfields were filled
        if textFields.allSatisfy({$0.text != ""}) {
            
            //Create a new contact
            let newContact = Contact()
            newContact.name = nameTextField.text!
            newContact.lastName = lastNameTextField.text!
            newContact.secondLastName = secondLastNameTextField.text!
            newContact.email = emailTextField.text!
            newContact.phoneNumber = phoneNumberTextField.text!
            
            //Save contact to Realm
            addContact(contact: newContact)
            
            //Clear textFields so we can add a new one
            clearTextFields()
            
            //Alert user
            let alert = UIAlertController(title: "Contact Added", message: "Your contact was added successfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Great", style: .default, handler: { [weak self] action in
                self?.view.endEditing(true)
            }))
            self.present(alert, animated: true, completion: nil)
            
        } else {
            //Missing info, alert the user
            let alert = UIAlertController(title: "Missing Info", message: "Please fill all text fields to add a contact.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    //Function to save a contact to Realm
    func addContact(contact: Contact){
        do {
            try realm.write({
                realm.add(contact)
            })
        } catch {
            print("Error saving contact \(error)")
        }
    }
    
    //Function to set the textFields.text to an empty String
    func clearTextFields(){
        for textfield in textFields{
            textfield.text = ""
        }
    }
}


//MARK: - TextField Methds
extension ViewController : UITextFieldDelegate {
    
    func setTextFieldsDelegates(){
        nameTextField.delegate = self
        lastNameTextField.delegate = self
        secondLastNameTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
    
    }
    
    //Dismiss keyboard on return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

//MARK: - UI Methods

extension ViewController {
    //UISetup - eye candy
    func setupLayout(){
        
        fieldsStackView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -25).isActive = true
        
        addContactButton.layer.cornerRadius = 15
        addContactButton.layer.masksToBounds = false
        addContactButton.layer.shadowColor = UIColor.white.cgColor
        addContactButton.layer.shadowOpacity = 0.5
        addContactButton.layer.shadowOffset = .zero
        addContactButton.layer.shadowRadius = 3
        
        for textField in textFields {
            textField.layer.shadowColor = UIColor.white.cgColor
            textField.layer.shadowOpacity = 0.5
            textField.layer.shadowOffset = .zero
            textField.layer.shadowRadius = 3
        }
    }
    
}

