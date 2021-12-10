//
//  ContactTableViewCell.swift
//  ContactsApp
//
//  Created by Fernando Pérez Ruiz on 09/12/21.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var contactContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(with contact: Contact){
        nameLabel.text = "\(contact.name )" + " \(contact.lastName)" + " \(contact.secondLastName)"
        emailLabel.text = contact.email
        phoneLabel.text = contact.phoneNumber
        
        contactContainerView.layer.cornerRadius = 15.0
        contactContainerView.layer.shadowOpacity = 0.5
        contactContainerView.layer.shadowColor = UIColor.white.cgColor
        contactContainerView.layer.masksToBounds = false
        contactContainerView.layer.shadowOffset = .zero
        contactContainerView.layer.shadowRadius = 3
    }
}
