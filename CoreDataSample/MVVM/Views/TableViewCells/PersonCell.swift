//
//  PersonCell.swift
//  CoreDataSample
//
//  Created by Kanakatti Shrikant on 06/11/22.
//

import UIKit

class PersonCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(_ personViewModel: PersonViewModel) {
        self.nameLabel.text = personViewModel.name
        self.massLabel.text = personViewModel.mass
        self.genderLabel.text = personViewModel.gender
        self.hairColorLabel.text = personViewModel.hairColor
        self.heightLabel.text = personViewModel.height
    }
}
