//
//  EmptyContactTableViewCell.swift
//  ContactsApp
//
//  Created by Fernando Pérez Ruiz on 09/12/21.
//

import UIKit

class EmptyContactTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var emptyCellLabel: UILabel!
    @IBOutlet weak var emptyCellContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupEmptyCell(){
        
        emptyCellLabel.text = "No contacts added yet"
        emptyCellContainerView.layer.cornerRadius = 15.0
        emptyCellContainerView.layer.shadowOpacity = 0.5
        emptyCellContainerView.layer.shadowColor = UIColor.white.cgColor
        emptyCellContainerView.layer.masksToBounds = false
        emptyCellContainerView.layer.shadowOffset = .zero
        emptyCellContainerView.layer.shadowRadius = 3
        
    }
}
